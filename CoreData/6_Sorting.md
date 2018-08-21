# Sorting

CoreData ya provee un mecanismo para esto, tenemos **firstName Sort Descriptor** y **lastName Sort Descriptor**.

## Add Sort descriptor

Vamos a recuperar los "friends" del modelo y vamos a ordenarlos.

``` Swift
//Return all the Friends
let request = Friend.fetchRequest() as NSFetchRequest<Friend>

//Sort them by the name
let sort = NSSortDescriptor(keyPath: \Friend.name, ascending:true)
request.sortDescriptors = [sort]
```

Ahora usamos el `#keyPath`:

```Swift
let sort = NSSortDescriptor(key: #keyPath(Friend.name), ascending:true, selector:request.sortDescriptors = [sort]

```
