//: Playground - noun: a place where people can play

import UIKit

let X:[Double] = [1000, 2000, 4000]
let Y:[Double] = [200000, 250000, 300000]

let m = X.count
var result = 0.0

//Function to calculate the predicted value
func h(_ x:Double,_ t0:Double,_ t1:Double)->Double{
    result = t0 + t1*x
    return result
}

/* given a theta_0 and theta_1, this function calculates
 their cost. We don't need this function, strictly speaking...
 but it is nice to print out the costs as gradient descent iterates.
 We should see the cost go down every time the values of theta get updated.
 */
func cost(_ theta_0:Double, _ theta_1:Double, _ x:[Double], _ y:[Double])->Double{
    var distance = 0.0
    for i in 0..<m {
        let square_feet = X[i]
        let predicted_value = theta_0 + theta_1 * square_feet
        let actual_value = Y[i]
        
        //how far off was the predicted value (make sure you get the absolute value)?
        distance = distance + abs(actual_value - predicted_value)
    }
    
    // get how far off we were on average
    distance = distance / Double(m)
    return distance
}

var alpha = 0.1
var iters = 1500

//initial values
var theta_0 = 0.0
var theta_1 = 0.0

for i in 0..<iters{
    /* we store this calculation in temporary variables,
     because theta_0 and theta_1 must be updated *together*.
     i.e. we can't update theta_0 and use the new theta_0 value
     while updating theta_1.
     */
    var cost_0 = 0.0
    for j in 0..<m {
        cost_0 = cost_0 + (h(X[j], theta_0, theta_1) - Y[j])
    }
    var temp_0 = theta_0 - alpha * 1/Double(m) * cost_0
    
    var cost_1 = 0.0
    for j in 0..<m {
        cost_1 = cost_1 + ((h(X[j], theta_0, theta_1) - Y[j]) * X[j])
    }
    var temp_1 = theta_1 - alpha * 1/Double(m) * cost_1
    
    theta_0 = temp_0
    theta_1 = temp_1
    
    // print out the new values of theta for each iteration,
    // as well as the new, lower cost
    print(theta_0, theta_1, cost(theta_0, theta_1, X, Y))
}

//plot(x, y, col='red')
//lines(1000:4000, h(1000:4000, theta_0, theta_1), col='green')
print(h(3000, theta_0, theta_1))












