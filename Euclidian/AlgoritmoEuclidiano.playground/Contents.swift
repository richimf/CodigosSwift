//: Playground - noun: a place where people can play

import UIKit

//Euclidian Algorithm

//a,b positive integers

let gdc = euclidian(a:120 ,b:500)


func euclidian(a:Int, b:Int)->Int{
    
    var x = a
    var y = b
    var r:Int
    
    while y != 0 {
        r = x%y
        x = y
        y = r
    }
    
    return x
}

print("Valor euclidiano es: \(gdc)")
