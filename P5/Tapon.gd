extends Spatial

onready var animation := $AnimationPlayer
enum { ABIERTO, CERRADO }
var estado := CERRADO

func accion() -> void:
	if animation.is_playing():
		yield(animation, "animation_finished")
	if estado == ABIERTO:
		animation.play("Cierre")
		estado = CERRADO
	elif estado == CERRADO:
		animation.play("Apertura")
		estado = ABIERTO
