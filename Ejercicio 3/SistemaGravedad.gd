extends Node

func aplicar(entidad: Spatial, delta:float):
	if entidad.componente_posicion.posicion.y > 0:
		entidad.componente_posicion.posicion.y-=entidad.componente_gravedad.gravedad * delta
