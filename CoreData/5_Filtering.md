# Filtering

Filtrar una lista. Como buscar un **friend** en particular de todos los posibles.

Le pides a CoreData un resultado filtrado, `\Friend.name` o bien `#keyPath(Friend.name)`.

Ahora vamos a filtrar via CoreData y no mediante un Array:

1.- Importamos CoreData.

2.- CoreData code para filtrar:

Usamos **NSFetchRequest()** si queremos algun dato de CoreData.
El Fetch Request esta representado por la clase NSFetchRequest.


``` Swift
	guard let query = searchBar.text else {
		return
	}

	//Filtrar por el valor del text y hacer la peticion.
	let request = Friend.fetchRequest() as NSFetchRequest<Friend>
	//request.predicate = NSPredicate(format: "name CONTAINS %@", query)
	request.predicate = NSPredicate(format: "name CONTAINS [cd]%@", query) //[cd] evita que sea Case-Sensitive

	do {
		friends = try context.fetch(request)
	}catch let error as NSError {
		print("Error")
	}
```

3.- Implementamos un metodo en caso de que el usuario presione Cancel, evitamos mostrarle los datos filtrados.

``` Swift
func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
	refresh()
	searchBar.text = nil
	searchBar.resingFirstResponder()
	collectionView.realoadData()
}

private func refresh() {
	do {
		friends = try context.fetch(Friend.fetchRequest())
	} catch let error as NSError {
		print("Could not fetch \(error) \(error.userInfo)")
	}
}
```