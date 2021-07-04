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
