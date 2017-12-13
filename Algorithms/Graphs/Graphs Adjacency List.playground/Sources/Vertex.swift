import Foundation

/*
To use your own custom type in a set or as the key type of a dictionary,
add Hashable conformance to your type by providing a hashValue property.
 
The Hashable protocol inherits from the Equatable protocol,
so you must also add an equal-to operator (==) function for your custom type.
*/

//Declaramos un Vertice... una bolita
public struct Vertex<T: Hashable> {
    var data: T
}

//Porque usaremos un vertex como una key en un dictionary
//necesitamos  que forme parte del protocolo Hashable
//some structure: SomeSuperclass, Protocol { ... }
extension Vertex:Hashable {
    
    //Hashable requiere que podamos obtener el hashValue
    public var hashValue: Int {
        return "\(data)".hashValue
    }
    
    //Iqual-to operator is mandatory!
    static public func == (lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.data == rhs.data
    }
}

//representacion como string
extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(data)"
    }
}

