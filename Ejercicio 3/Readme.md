## Ejercicio teórico-práctico 3: Estudio de un sistema ECS en Godot

Escribe el pseudocódigo de un objeto Singleton de Godot que permita gestionar  un ECS. Define (e indica) para ello tres componentes y dos sistemas  diferentes (el primer sistema trataría el comportamiento de dos de los  componentes y el segundo sistema el comportamiento del tercer  componente). Asume que las entidades se crearán y destruirán de forma  dinámica en el mundo, y que también será dinámica la asignación de  componentes a las entidades (todo según la interacción del usuario en  tiempo real).

Explica qué señales que habría  que tener y dónde, qué grupos tendríamos y qué métodos tendría nuestro  singleton. También explica que tipo de estructura necesitamos para cada  entidad y sistema. 



## Solucion:

**1. Mis tres componentes son:** Entrada, Posición, Gravedad 

Entrada se refiere a las teclas que pulsa el usuario.

**2. Mis entidades se representan computacionalmente como:**

Nodos con las siguientes propiedades:

- Deben de estar añadidos a los grupos de los componentes correspondientes.
- En caso de que los componentes en uso no sean singleton, cargar una instancia de cada componente en una variable local.
- Debe de añadirse a la lista de componentes del singleton Observador.

**3. Mis sistemas se representan computacionalmente como:** 

clases singleton que contienen una método aplicar() que recibe delta y el componente sobre el que se va a actuar.

**4. Los métodos y su justificación son las siguientes:**

- SistemaGravedad.aplicar(entidad, delta): Se encarga de aplicar la gravedad al ComponentePosicion de la  entidad que se le pase como argumento
- SistemaMovimiento.aplicar(entidad, delta): Lee la entrada del usuario a través del ComponenteEntrada y  aplica el desplazamiento correspondiente al ComponentePosicion de  entidad.
- Observador.componente_a_nodo(entidad): Hace que la  posición de la entidad sea igual a la de su componente. Necesario para  que los efectos del desplazamiento sean visibles.

**5. El pseudo algoritmo sería el siguiente:**

```python
#Observador.gd
extends Node

var entidades := []

func componente_a_nodo(entidad: Spatial):
    entidad.translation = entidad.componente_posicion.posicion

func _process(delta:float):
    for e in entidades:
        if e.is_in_group("Posicion"):
            if e.is_in_group("Gravedad"):
                SistemaGravedad.aplicar(e, delta)
            if e.is_in_group("Entrada"):
                SistemaMovimiento.aplicar(e, delta)
            componente_a_nodo(e)

#Cubo.gd
extends MeshInstance

var componente_posicion = load("res://ComponentePosicion.gd").new()
var componente_gravedad = load("res://ComponenteGravedad.gd").new()

func _ready():
    add_to_group("Gravedad")
    add_to_group("Posicion")
    add_to_group("Entrada")
    Observador.entidades.push_back(self)

```

