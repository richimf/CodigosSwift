//: Playground - noun: a place where people can play

import UIKit

// Protocol extension dispatching
protocol WinLoss {
  var wins: Int { get }
  var losses: Int { get }
}
extension WinLoss {
  var winningPercentage: Double {
    return Double(wins) / (Double(wins) + Double(losses))
  }
}

// Adopted the protocol
struct CricketRecord: WinLoss {
  var wins: Int
  var losses: Int
  var draws: Int
  
  var winningPercentage: Double {
    return Double(wins) / (Double(wins) + Double(losses) + Double(draws))
  }
}

let miamiTuples = CricketRecord(wins: 8, losses: 7, draws: 1)
let winLoss: WinLoss = miamiTuples // <- Le asignamos la misma instancia, pero el resultado es diferente....

miamiTuples.winningPercentage // 0.5
winLoss.winningPercentage     // 0.533333








