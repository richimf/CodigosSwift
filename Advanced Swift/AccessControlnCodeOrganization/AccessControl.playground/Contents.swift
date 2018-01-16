
//*----> ACCESS CONTROL<---*//
/*
 When defining a protocol, it’s sometimes useful to declare one or more associated types as part of the protocol’s definition.
 An associated type gives a "placeholder name" to a type that is used as part of the protocol.
 The actual type to use for that associated type isn’t specified until the protocol is adopted.
 Associated types are specified with the associatedtype keyword.
 */
//Example:
protocol MiProtocolo {
    associatedtype Algo
    var variable: Algo { get }
}

//associatedtype simplemente indica que hay un tipo de dato utilizado en este protocolo, sin especificar que tipo debe ser.
//private(set) hace que no se pueda modificar la variable haciendo una llamada tipo: account.balance = 1000000
protocol Account {
    associatedtype Currency
    private(set) var balance: Currency { get }
    var balance: Currency { get }
    func deposit(amount: Currency)
    func withdraw(amount: Currency)
}

typealias Dollars = Double
/// A U.S. Dollar based "basic" account.
class BasicAccount: Account {
    var balance: Dollars = 0.0
    func deposit(amount: Dollars) {
        balance += amount
    }
    func withdraw(amount: Dollars) {
        if amount < balance {
            balance -= amount
        } else {
            balance = 0
        }
    }
}

//implementation
let account = BasicAccount()
account.balance
account.deposit(amount: 100.0)
print(account.balance)
account.withdraw(amount: 5)
print(account.balance)
//account.balance = 1000000 //Esto no se puede si la variable 'balance' esta declarado como: private(set)
//print(account.balance)









