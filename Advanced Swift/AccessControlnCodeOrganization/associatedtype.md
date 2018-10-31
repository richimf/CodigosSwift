## Access Control

Private
Restringe el acceso a la entidad donde esta definida, asi como cualquier tipo anidado en él, comocido como `lexical scope`.

*lexical scope*:  A variable so that it may only be called (referenced) from within the block of code in which it is defined.

Fileprivate:
Muy cercano a private, el cual permite el acceso a cualquier codigo escrito en el mismo archivo como una entidad, en lugar de solo el mismo lexical scope como en private.

Con private y fileprivate eres capaz de proteger el codigo de ser accesado por otros tipos y archivos. 

El modificador de acceso por defecto es: Internal. Esto indica que una entidad puede ser accesada desde cualquier lugar dentro del modulo en donde es definido. Digamos, si estamos trabajando en el mismo playground, estamos en el mismo modulo.

Todos los archivos en *Sources* pertenecen al mismo modulo, y todo en el Playground es otro modulo, que consume al modulo de Sources.

**Open**: For a class, method or property to be overridden by code in another module, it is required to be declared `open`.








