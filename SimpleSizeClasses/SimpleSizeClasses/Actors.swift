//
//  Actors.swift
//  SimpleSizeClasses
//
//  Created by Kunal Kumar R on 17/07/24.
//

import Foundation

actor BankAccount {
    private var balance: Int
    
    init(intialBalance: Int) {
        self.balance = intialBalance
    }
    
    func deposit(amount: Int) {
        balance += amount
    }
    
    func withdraw(amount: Int) -> Int {
        if balance >= amount {
            balance -= amount
            return amount
        }else {
            let availableBalance = balance
            balance = 0
            return availableBalance
        }
    }
    
    func balanceConfiguration() -> Int {
        self.balance
    }
}

func transfer(amount: Int, from: BankAccount, to: BankAccount) async throws {
    let availableBalance = await from.withdraw(amount: amount)
    await to.deposit(amount: amount)
}

let firstBankAccount = BankAccount(intialBalance: 1000)
let secondBankAccount = BankAccount(intialBalance: 10)

func update() async {
    Task {
        try await transfer(amount: 100, from: firstBankAccount, to: secondBankAccount)
        print("Transfer Completed from firstBankAccount to secondBankAccount")
    }
    
    Task {
        try await transfer(amount: 1000, from: firstBankAccount, to: secondBankAccount)
        print("Transfer Completed from firstBankAccount to secondBankAccount")
    }
}

func configuration() async {
    Task {
        let firstAccountBalance = await firstBankAccount.balanceConfiguration()
        let secondAccountBalance = await secondBankAccount.balanceConfiguration()
        
        print("firstAccountBalance: \(firstAccountBalance), secondAccountBalance: \(secondAccountBalance)")
    }
}


