## Key Value Coding (KVC)

**Key-Value-Coding (KVC)** means accessing a property or value using a String.

``` Objective-C
id someValue = [myObject valueForKeyPath:@"foo.bar.baz"];
```

Which could be the same as:

``` Objective-C
id someValue = [[[myObject foo] bar] baz];
```

## Key Value Observing (KVO)

**Key-Value-Observing (KVO)** allows you to observe changes to a property or value.

To observe a property using KVO you would identify to property with a string; i.e., using KVC. Therefore, the observable object must be KVC compliant.

``` Objective-C
[myObject addObserver:self forKeyPath:@"foo.bar.baz" options:0 context:NULL];
```




