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

[1. Basics, Como agregar CoreData a un proyecto ya existente, una Entity basica](1_Coredata_Basics.md)

[2. Managed Objects, Como usar las clases generadas por Xcode y como guardar info](2_Coredata_Managed_Objects.md)

[3. Attributes, Available Types, Transformable](3_Attributes.md)

[4. Binary Data, How to save/read a photo](4_Binary_Data.md)

[5. Filtering, mediante un query a CoreData](5_Filtering.md)

[6. Sorting](6_Sorting.md)

[7. Fetched Results Controller](7_Fetched_Results_Controller.md)