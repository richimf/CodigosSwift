//: Playground - noun: a place where people can play

import UIKit

import UIKit
import XCPlayground

let adjacencyList = AdjacencyList<String>()

let hidalgo = adjacencyList.createVertex(data: "Hidalgo")
let balderas = adjacencyList.createVertex(data: "Balderas")
let insurgentes = adjacencyList.createVertex(data: "Insurgentes")
let potrero = adjacencyList.createVertex(data: "Potrero")
let condesa = adjacencyList.createVertex(data: "Condesa")
let aeropuerto = adjacencyList.createVertex(data: "Aeropuerto")
let roma = adjacencyList.createVertex(data: "Roma")
let polanco = adjacencyList.createVertex(data: "Polanco")

adjacencyList.add(.undirected, from: hidalgo, to: insurgentes, weight: 300)
adjacencyList.add(.undirected, from: hidalgo, to: balderas, weight: 500)
adjacencyList.add(.undirected, from: insurgentes, to: balderas, weight: 250)
adjacencyList.add(.undirected, from: balderas, to: potrero, weight: 450)
adjacencyList.add(.undirected, from: balderas, to: aeropuerto, weight: 300)
adjacencyList.add(.undirected, from: insurgentes, to: condesa, weight: 600)
adjacencyList.add(.undirected, from: potrero, to: roma, weight: 50)
adjacencyList.add(.undirected, from: roma, to: aeropuerto, weight: 292)
adjacencyList.add(.undirected, from: condesa, to: aeropuerto, weight: 337)
adjacencyList.add(.undirected, from: aeropuerto, to: polanco, weight: 277)
adjacencyList.add(.undirected, from: condesa, to: polanco, weight: 218)
adjacencyList.add(.undirected, from: roma, to: condesa, weight: 297)

print(adjacencyList.description)
