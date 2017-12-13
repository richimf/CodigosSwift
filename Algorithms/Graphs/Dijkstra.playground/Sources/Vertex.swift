
import Foundation

open class Vertex {
    
    //Cada vertice debe ser unico, por eso ponemos un identificadorCada
    open var identifier:String
    
    //Vertex es un vecino y Double es el peso hacia ese vecino
    open var neighbors: [(Vertex, Double)] = []
    
    //Definimos la longitud de cada path como infinitoscada
    open var pathLengthFromStart = Double.infinity
    
    //Este array conteine los vertices
    open var pathVerticesFromStart: [Vertex] = []
    
    //constructor
    public init(identifier:String){
        self.identifier = identifier
    }
    
    open func clearCache() {
        pathLengthFromStart = Double.infinity
        pathVerticesFromStart = []
    }
    
}
