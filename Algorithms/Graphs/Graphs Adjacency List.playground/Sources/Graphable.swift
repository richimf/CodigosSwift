import Foundation

protocol Graphable {
    
    //El protocolo requiere un elemenento associatedType llamado Element.
    //Esto permite al protocolo ser generic y aceptar cualquier tipo de dato.
    associatedtype Element: Hashable
   
    //Imprimir el contenido del grafo
    var description: CustomStringConvertible { get } // 2
    
    //crea un vertice
    func createVertex(data: Element) -> Vertex<Element> // 3
    
    //agregar un edge entre dos vertices V --- V
    func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) // 4
    
    //obtener el peso de un edge entre dos vertices
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double? // 5
    
    //recupera todos los edges que conectan a un vertice
    func edges(from source: Vertex<Element>) -> [Edge<Element>]? // 6
}

