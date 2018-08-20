# Coredata

Como agregar Core Data una vez que se ha creado el proyecto.

## Integrar CoreData en una App

**Right Click (on resources folder) > New File > Core Data > Data Model > Next > "Name it" > Create.**

## Basics

### Agregamos una Entidad

**Entity** es un CoreData Class.

Seleccionamos el CoreData Model (.xcdatamodeld).

**Add Entity > "Name it" (ej. Friend)**, con este Entity representaremos a nuestros amigos.

![](./images/0_entity_friend.png)

**Codegen:** crea el código por nosotros.

![](./images/0_codegen_manual.png)

**Attributes:** Pondremos "name" de tipo "String" y seleccionamos que el Attribute no es de tipo Optional.

![](./images/0_attribute_name_not_optional.png)

Ahora, generaremos las clases de CoreData.

Vamos al siguiente menu **Editor > Create NSManaged Object Subclass...**

![](./images/0_nsmanaged_object.png)

Luego seleccionamos los Modelos y Entidades que deseamos manejar, y presionamos Create.

![](./images/0_nsmanaged_object.png)

![](./images/0_data_model.png)

![](./images/0_entities.png)


Y vemos como crea nuevas clases de Core Data, en estas clases basicamente editamos el CoreDataClass, el CoreDataProperties se quedaria asi como esta.

![](./images/0_coredata_classes.png)






 
 