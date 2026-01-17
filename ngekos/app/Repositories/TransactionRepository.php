<?php
namespace App\Repositories;

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
}
