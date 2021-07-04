extends Spatial

onready var animation : AnimationPlayer = $AnimationPlayer

func _process(_delta : float):
	if Input.is_action_just_pressed("titilar"):
		animation.play("titilar")
