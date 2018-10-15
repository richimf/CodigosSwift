# associatedtype


Al definir un protocolo, en ocasiones es útil declarar uno o mas tipos asociados `associatedtype` como parte de la definición del protocolo:

``` Swift
protocol Account {
  associatedtype Currency
  var balance: Currency { get }
  func deposit(amount: Currency)
  func withdraw(amount: Currency)
}
```

¿Para que sirve el `associatedtype`?

Bueno, le decimos al protocolo que tendrá un tipo de dato, aun no le decimos si este será `Int, Float, Double, String`, etc..., solo le decimos que tendra "algún" valor.

El tipo de valor a usar por el `associatedtype` no esta especificado hasta que el protocolo sea adoptado.

**Ejemplo**: Se observa como **Currency** pasa a ser **Dollars**, y **Dollars** es un **Double**.

``` Swift
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
```
