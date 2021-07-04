extends Camera

onready var Yaw := get_parent();
export var sensibility := 200
export var max_angle := 85

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	if current:
		if Input.is_action_pressed("fpv_delante"):
			Yaw.translate_object_local(Vector3(0,0,-delta))
		if Input.is_action_pressed("fpv_detras"):
			Yaw.translate_object_local(Vector3(0,0,delta))
		if Input.is_action_pressed("fpv_izquierda"):
			Yaw.translate_object_local(Vector3(delta,0,0))
		if Input.is_action_pressed("fpv_derecha"):
			Yaw.translate_object_local(Vector3(-delta,0,0))
	if Input.is_action_pressed("ui_cancel"):
			get_tree().quit()


func _input(event):
	if event is InputEventMouseMotion:
		print(event.relative.y)
		Yaw.rotate_object_local(Vector3(0,1,0), -event.relative.x/sensibility)
		print(rotation_degrees.x)
		if rotation_degrees.x <= max_angle :
			if rotation_degrees.x >= -max_angle:
				rotate_object_local(Vector3(1,0,0), -event.relative.y/sensibility)
			elif event.relative.y<0:
				rotate_object_local(Vector3(1,0,0), -event.relative.y/sensibility)
		elif event.relative.y>0:		
			rotate_object_local(Vector3(1,0,0), -event.relative.y/sensibility)
				


func _on_P4_camara_1():
	current = true
