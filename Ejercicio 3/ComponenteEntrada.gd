extends Node

var teclas := { "up" : false, "down" : false, "left" : false, "right" : false, "jump":false }

func _process(delta : float):
	teclas = {
		"up" : Input.is_action_pressed("ui_up"),
		"down" : Input.is_action_pressed("ui_down"),
		"left" : Input.is_action_pressed("ui_left"),
		"right" : Input.is_action_pressed("ui_right"),
		"jump" : Input.is_action_pressed("ui_accept")
	}
