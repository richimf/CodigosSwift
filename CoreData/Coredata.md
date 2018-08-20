# CoreData

## Introducción

Data persistance.
Podemos usar NSUserDefaults, pero no recomendamos guardar Datos ahí.

Tenemos CoreData, Realm y SQlite como alternativas para persistencia de datos en iOS.

**Core Data no es una Base de Datos**, ya que se encarga de *preservar* tus objetos como tal para que sea posible acceder a ellos y a su información, *CoreData saves the object itself*.

- Es posible escalarlo a Gigabytes de datos
- Optimizado para consumo de memoria
- Disponible en iOS y macOS

### Temas:

[1. Basics, como agregar CoreData a un proyecto ya existente, una Entity basica](1_Coredata_ Basics.md)

[2. Managed Objects, como usar las clases generadas por Xcode y como guardar info](2_Coredata_Managed_Objects.md)
