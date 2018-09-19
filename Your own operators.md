

# Your own operators

``` Swift
extension CGPoint {
	static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint { }
	static prefix func -(input: CGPoint) -> CGPoint { }
	static func(lhs: CGPoint, rhs: CGPoint) -> CGPoint { }
}
```

`infix operator !!: NilCoalescingPrecedence`

You can chose from **Precedence Groups**, for instance, `BitwiseShiftPrecedence` `<< >>` is executed first, and `AssignmentPrecednece` is executed last `+=, =, *=`
