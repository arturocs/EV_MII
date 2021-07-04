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
	if Input.is_action_just_pressed("Cambiar_camara"):
		if $"Camara Eje2/Camera".current == true:
			get_parent().get_node("Camera").current=true
		else:
			$"Camara Eje2/Camera".current = true
		
