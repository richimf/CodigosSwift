# EXTENSIONS #

### Shared Container ###
El **Shared Container** es una localidad en el disco el cuál nos permite compartir Settings entre una App y su Extension.

#### Core Data ####
Core Data usualmente guarda los datos en un archivo conocido como "App's persistent stored file" el cuál se encuentra dentro del directorio de la misma App. Sin embargo, usamos el **Shared Container** para que la App y el Extension puedan compartir los mismos datos.


#### Group ID ####
Para poder utilizar el **Shared Container** debemos crear un *APP_GROUP_ID* y este ID se debe compartir en cada *Target* de la App.
En el proyecto de Xcode seleccionamos el Target de la App y el Target del Widget o Extension, esto se debe hacer para ambos.
<img src="https://github.com/richimf/CodigosSwift/blob/master/Extensions/ActivateGroupId.png" width="750">

Luego, podemos utilizar el Group ID, por ejemplo:

```Swift
let fileManager = NSFileManager.defaultManager()
let url = fileManager.containerURLForSecurityApplicationGroupIdentifier(“APP_GROUP_ID”)
```


### Network Requests ###
Los extensions pueden hacer peticiones a internet utilizando NSURLSession, pero hay tres cosas que debemos tener en cuenta:
- Debemos tener **configuration identifiers** diferentes, uno para la App y una para el Extension. Esto es importante en caso de que tengamos que correr procesos en paralelo y consultemos la misma fuente de datos.
```Swift
config.sharedContainerIdentifier = "com.MyApp"
config.sharedConteinerIdentifier = "com.MyAppExtension"
```

- Trabajar en el background. Es importante manejar procesos en el background ya que Notification Center puede ser abierto o cerrado muy rápido, entonces es conveniente trabajar por "debajo" y cuando se abra el Notification Center mostrar los datos. 
```Swift
NSURLSessionConfiguration.backgroundSessionConfigurationWithIdentifier(config)
```

- Compart datos. Quizas haya datos que compartes con la App y con el Extension, en este caso NSURLSession usa el **Shared Container** y el Groud ID.
```Swift
config.sharedContainerIdentifier = "groud.com.myGroupdID"
```

El Widget extension implementa protocolo para actualizar su vista. Con este método podemos comenzar a hacer los Requests y comenzar a actualizar los datos.
```Swift
func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateREsult) -> Void)) {

	//Request new data...
	//When you finish, implement:
	completionHandler(NCUpdateResult.NewData) //Call me when you are done
}
```
En donde tenemos tres opciones:
```Swift
	case NewData
	case NoData
	case Failed
```


#### Frameworks entre Extensions ####
Cuando queremos utilizar un framework en un Extension, debemos indicar en las opciones del Target y tambien agregarlo al Extension.
Veamos las siguientes imágenes.

<img src="https://github.com/richimf/CodigosSwift/blob/master/Extensions/Include%20Framework%20with%20Extensions.png" width="750">
<img src="https://github.com/richimf/CodigosSwift/blob/master/Extensions/Include%20Framework%20with%20Extensions%20in%20Widget.png" width="750">










