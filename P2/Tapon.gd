extends Spatial

onready var animation := $AnimationPlayer
enum { ABIERTO, CERRADO }

var estado := CERRADO
func _process(_delta : float):
	if Input.is_action_pressed("ui_accept") and not animation.is_playing():
		if estado == ABIERTO:
			animation.play("Cierre")
			estado = CERRADO
		elif estado == CERRADO:
			animation.play("Apertura")
			estado = ABIERTO
