extends Spatial

onready var animation := $AnimationPlayer

func _process(delta : float):
	if Input.is_action_just_pressed("titilar"):
		animation.play("titilar")
