<?php

// namespace App\Http\Controllers\Api\MidtransController;
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Transaction;
use Illuminate\Support\Facades\Log;

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
