## Lazy properties

Lazy properties are properties being delayed in their creation until we need them. Some properties are rarely used or their creation is expensive. These types of properties should be marked as lazy, so they will be created once we need them.

Using lazy properties is a **good sign that you really care about memory** especially for mobile apps where memory is limited.

Note: Lazy properties must always be declared as variables `var`, avoid  using `let`.

``` Swift
class ViewModel {

	//Properties
    var dateFormatter1 = DateFormatter()
    var dateFormatter2: DateFormatter {
        let df = DateFormatter()
        return df
    }
    
    //Lazy Properties
    lazy var dateFormatter3 = DateFormatter()
    lazy var dateFormatter4: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "MM, YYYY"
        return df
    }()
}
```

* `dateFormatter1`: is a **stored property** and the code after equal sign will be executed once after initialization. Every time you access *dateFormatter1*, same instance will be returned to you.

* `dateFormatter2`: is totally different from example 1 as this property is **computed property**. Every time you access *dateFormatter2*, the code after the equal sign will be executed and gives you a totally new instance of DateFormatter.

* `dateFormatter3`: is similar to example 1 but the creation (code after equal sign) will be **executed only once** after you access the property.

* `dateFormatter4`: the lazy property is initialized using a closure which gives you flexibility to customize the initialized object like setting dateFormat as you see in the example. Think of it as a **special kind of computed property that will be computed only once**. The code after the equal sign will be executed only once when you access the property.

Note: 
We have two types of closures `escaping` and `noescaping `closures.
`escaping`, the closure is passed as an argument to a function and is called after the function returns.

## Reference

[Lazy Properties in iOS](https://medium.com/@hossamghareeb/lazy-properties-in-ios-39cda14ec14f)

