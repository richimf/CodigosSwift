# Delegates

Es un patrón de diseño que permite a un objeto enviar mensajes a otro objeto cuando un evento en especifico pasa.

¿Como comunicamos dos ViewControllers?

**Step 1**: Create a Protocol:

``` Swift
protocol ClassBVCDelegate: class {
	func changeBackgroundColor(_ color: UIColor?)
}
```

**Step 2**: En la clase B declara una variable de tipo del protocolo, esta debe ser `weak` para evitar **retain cycles**.

``` Swift
  weak var delegate: ClassBVCDelegate?
```

**Step 3**: En la clase B usamos la instancia del Delegate y envaimos info :V

``` Swift
func handleTap(_ tapGesture: UITapGestureRecognizer) {
  view.backgroundColor = tapGesture.view?.backgroundColor
  delegate?.changeBackgroundColor(tapGesture.view?.backgroundColor)
}
```

Ahora vamos a la clase A, y ahi conformaremos al protocolo.

``` Swift
class ClassAVC: UIViewController, ClassBVCDelegate {
...
//Delegate methods
func changeBackgroundColor(_ color: UIColor?) {...}
}
```



