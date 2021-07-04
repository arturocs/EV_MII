extends Spatial

onready var eje2 : Spatial =  $"Camara Eje2"
onready var camera : Camera = $"Camara Eje2/Camera"

func _process(delta : float) -> void:
	if camera.current:
		if Input.is_action_pressed("Camara_derecha"):
			self.rotate_y(2*delta)
		if Input.is_action_pressed("Camara_izquierda"):
			self.rotate_y(-2*delta)
		if Input.is_action_pressed("Camara_arriba") and eje2.rotation_degrees.z > -90:
			eje2.rotate_z(-2*delta)
		if Input.is_action_pressed("Camara_abajo") and eje2.rotation_degrees.z < 90:
			eje2.rotate_z(2*delta)

func _on_P5_camara_2() -> void:
	camera.current = true
