extends Node

func aplicar(entidad:Spatial, delta: float):
	if ComponenteEntrada.teclas["up"]:
		entidad.componente_posicion.posicion.x -=3*delta
	if ComponenteEntrada.teclas["down"]:
		entidad.componente_posicion.posicion.x +=3*delta
	if ComponenteEntrada.teclas["left"]:
		entidad.componente_posicion.posicion.z +=3*delta
	if ComponenteEntrada.teclas["right"]:
		entidad.componente_posicion.posicion.z -=3*delta
	if ComponenteEntrada.teclas["jump"] and entidad.componente_posicion.posicion.y <= 0:
		entidad.componente_posicion.posicion.y +=40*delta
