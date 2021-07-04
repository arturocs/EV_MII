extends MeshInstance

var componente_posicion = load("res://ComponentePosicion.gd").new()
var componente_gravedad = load("res://ComponenteGravedad.gd").new()

func _ready():
	add_to_group("Gravedad")
	add_to_group("Posicion")
	add_to_group("Entrada")
	Observador.entidades.push_back(self)
