import Foundation
/*
 open class es accessible y subclassable fuera del modulo donde es definido.
 Puede ser accessible y ovverridable afuera del modulo de definicion.

 a diferencia de public, una clase publica es accessible pero no subclassable fuera del modulo de definicion. Public es accesible pero no overridable fuera del modulo de definicion.
 
 "open" es mas publico que "public", proveendo de un simple y limpio modelo.
 open sirve para herencia en otros modulos
 
*/
open class AdjacencyList<T: Hashable> {
    
    //Diccionario de Adyacencia, para representa la matriz de adyacencia del Grafo
    public var adjacencyDict : [Vertex<T>: [Edge<T>]] = [:]
    
    //constructor vacio
    public init(){}
    
    fileprivate func addUndirectedEdge(vertices: (Vertex<Element>, Vertex<Element>), weight: Double?) {
        let (source, destination) = vertices
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    
    fileprivate func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencyDict[source]?.append(edge)
    }
}

extension AdjacencyList: Graphable {
   
    public typealias Element = T
    
    public func createVertex(data: Element) -> Vertex<Element> {
        let vertex = Vertex(data: data)
        
        if adjacencyDict[vertex] == nil {
            adjacencyDict[vertex] = []
        }
        
        return vertex
    }
    
    public func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        switch type {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(vertices: (source, destination), weight: weight)
        }
    }
    
    public func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double? {
        guard let edges = adjacencyDict[source] else { // 1
            return nil
        }
        
        for edge in edges { // 2
            if edge.destination == destination { // 3
                return edge.weight
            }
        }
        
        return nil // 4
    }
    
    public func edges(from source: Vertex<Element>) -> [Edge<Element>]? {
        return adjacencyDict[source]
    }
    
    public var description: CustomStringConvertible {
        var result = ""
        for (vertex, edges) in adjacencyDict {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(vertex) ---> [ \(edgeString) ] \n ")
        }
        return result
    }
}

