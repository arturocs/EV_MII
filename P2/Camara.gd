extends Spatial

onready var eje2 :=  $"Camara Eje2"

func _process(delta : float):
	if Input.is_action_pressed("Camara_derecha"):
		self.rotate_y(2*delta)
	if Input.is_action_pressed("Camara_izquierda"):
		self.rotate_y(-2*delta)
	if Input.is_action_pressed("Camara_arriba") and eje2.rotation_degrees.z > -90:
		eje2.rotate_z(-2*delta)
	if Input.is_action_pressed("Camara_abajo") and eje2.rotation_degrees.z < 90:
		eje2.rotate_z(2*delta)
