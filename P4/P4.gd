extends Spatial
signal camara_1
signal camara_2

var camera := 1


# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("camera_"+str(camera))

func _process(delta):
	if Input.is_action_just_pressed("Cambiar_camara"):
		if camera == 1:
			camera = 2
			emit_signal("camara_2")
		elif camera == 2:
			camera = 1
			emit_signal("camara_1")
		else:
			print("Solo hay dos cámaras")
