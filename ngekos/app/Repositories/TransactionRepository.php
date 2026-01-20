<?php
namespace App\Repositories;
use App\Models\Room;
use App\Models\Transaction;


class TransactionRepository implements \App\Interfaces\TransactionRepositoryInterface
{
    public function getTransactionDataFromSession()
    {
        return session()->get('transaction');
    }

    public function saveTransactionDataToSession($data)
    {
       $transaction = session()->get('transaction', []);

       foreach ($data as $key => $value) {
           $transaction[$key] = $value;
       }

         session()->put('transaction', $transaction);
    }

    public function saveTransaction($data)
    {
        $room = Room::find($data['room_id']);
        $data = $this->prepareTransactionData($data, $room);
        $transaction = Transaction::create($data);
        session()->forget('transaction');
        return $transaction;
    }

    private function prepareTransactionData($data, $room)
    {
        $data['code'] =$this->generateTransactionCode();
        $data['payment_status'] = 'pending';
        $data['transaction_date'] = now();

        $total = $this->calculateTotalAmount($room->price_per_month, $data['duration']);
        $data['total_amount'] = $this->calculationPaymentAmount($total, $data['payment_method']);
        return $data;
    }

    private function generateTransactionCode()
    {
        // return 'TRX-' . strtoupper(uniqid());
        return 'TRX-' . rand(100000, 999999);
    }

    private function calculateTotalAmount($pricePerMonth, $duration)
    {
        $subtotal = $pricePerMonth * $duration;
        $tax = $subtotal * 0.11; // 10% tax
        $insurance = $subtotal * 0.01; // fixed insurance fee
        return $subtotal + $tax + $insurance;
    }

    private function calculationPaymentAmount($total, $paymentMethod)
    {
        return $paymentMethod === 'full_payment' ? $total : $total * 0.3;
    }
}
