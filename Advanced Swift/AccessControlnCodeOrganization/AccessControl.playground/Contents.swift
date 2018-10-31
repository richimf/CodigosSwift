//: Playground - noun: a place where people can play
import UIKit

protocol Account {
  associatedtype Currency
  var balance: Currency { get }
  func deposit(amount: Currency)
  func withdraw(amount: Currency)
}

typealias Dollars = Double

class BasicAccount: Account {
  
  private(set) var balance: Dollars = 0.0
  
  func deposit(amount: Dollars) {
    balance += amount
  }
  func withdraw(amount: Dollars) {
    if amount > balance {
      balance -= amount
    } else {
      balance = 0
    }
  }
}

// Create a new account
let account = BasicAccount()
// Deposit and withdraw some money
account.deposit(amount: 10.00)
account.withdraw(amount: 5.00)
// ... or do evil things!
account.balance = 1000000.00

