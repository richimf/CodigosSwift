import Foundation

//Un grafo puede ser dirigido o no dirigido
public enum EdgeType{
    case directed, undirected
}

//Un vertice tiene peso, origen y destino.
public struct Edge<T: Hashable>{
    public var source:Vertex<T> //nodo origen
    public var destination: Vertex<T> //nodo destino
    public let weight: Double?
}

//Edge conforma el protocolo Hashable
extension Edge: Hashable{
    
    public var hashValue: Int {
        return "\(source) \(destination) \(String(describing: weight))".hashValue
    }
    
    static public func ==(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
        return lhs.source == rhs.source &&
            lhs.destination == rhs.destination &&
            lhs.weight == rhs.weight
    }
}
