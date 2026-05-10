<?php

// namespace App\Http\Controllers\Api\MidtransController;
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Transaction;
use Illuminate\Support\Facades\Log;

use Twilio\Rest\Client;

class MidtransController extends Controller
{
    public function callback(Request $request)
    {
        Log::info('MIDTRANS CALLBACK', $request->all());

        $serverKey = config('midtrans.serverKey');
        $hashed = hash('sha512', $request->order_id . $request->status_code . $request->gross_amount . $serverKey);

        if ($hashed !== $request->signature_key) {
            return response()->json([
                'message' => 'Invalid signature'
            ], 403);
        }


        $transactionStatus = $request->transaction_status;
        $orderId = $request->order_id;
       $transaction = Transaction::where('code', $orderId)->first();

       if(!$transaction) {
           return response()->json([
               'message' => 'Transaction not found'
           ], 404);
       }

        // Twilio Notification Integration
        // You can customize the message content as needed
        //==========================================================

        $sid    = "ACbea31fb0c906445090991b3830b05bda";
        $token  = "f7e0673411b12f2284fe6a82f1e92804";
        $twilio = new Client($sid, $token);

        // $message = "Hallo," . $transaction->name . "! Pembayaran dengan kode transaksi " . $transaction->code . " saat ini berstatus: " . $transactionStatus . ". Terima kasih telah menggunakan layanan kami!";
        $message =
            "Halo, " . $transaction->name . "!" . PHP_EOL . PHP_EOL .
            "Kami telah menerima pembayaran Anda dengan kode booking: " . $transaction->code . "." . PHP_EOL .
            "Total pembayaran: Rp " . number_format($transaction->total_amount, 0, ',', '.') . PHP_EOL . PHP_EOL .
            "Anda bisa datang ke kos " . $transaction->boardingHouse->name . PHP_EOL .
            "Alamat: " . $transaction->boardingHouse->address . PHP_EOL .
            "Mulai tanggal: " . date('d-m-Y', strtotime($transaction->start_date)) . PHP_EOL . PHP_EOL .
            "Terima kasih atas kepercayaan Anda! " . PHP_EOL .
            "Kami tunggu kedatangan Anda.";
        // End of Twilio Notification Integration
        //==========================================================


       switch($transactionStatus) {
           case 'capture':
            if($request->payment_type == 'credit_card')
            {
                if($request->fraud_status == 'challenge') {
                    $transaction->update(['payment_status' => 'pending']);
                } else {
                    $transaction->update(['payment_status' => 'success']);
                }
            }

               break;
           case 'settlement':
               $transaction->update(['payment_status' => 'success']);

               // Send WhatsApp notification using Twilio
               //==========================================================
               $twilio->messages
                        ->create("whatsapp:+".$transaction->phone_number, // to
                            array(
                            "from" => "whatsapp:+14155238886",
                            "body" => $message
                            )
                        );
                //=====================================================
                // end of Twilio integration

               break;
           case 'pending':
               $transaction->update(['payment_status' => 'pending']);
               break;
           case 'deny':
               $transaction->update(['payment_status' => 'failed']);
               break;
           case 'expire':
               $transaction->update(['payment_status' => 'expired']);
               break;
           case 'cancel':
               $transaction->update(['payment_status' => 'cancelled']);
               break;
            default:
               $transaction->update(['payment_status' => 'unknown']);
               break;
       }
       return response()->json([
           'message' => 'Callback received successfully'
       ]);
    }
}
