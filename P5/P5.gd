extends Spatial
signal camara_1
signal camara_2

var camera := 1
onready var habitacion : Spatial = $Habitacion
onready var cupula : Spatial = $Cupula
onready var coordenadas_cupula : Vector3 =  cupula.global_transform.origin
onready var coordenadas_habitacion : Vector3 = habitacion.global_transform.origin

func _ready() -> void:
	emit_signal("camera_"+str(camera))

func _process(_delta : float) -> void:
	if Input.is_action_just_pressed("Cambiar_camara"):
		if camera == 1:
			camera = 2
			emit_signal("camara_2")
		elif camera == 2:
			camera = 1
			emit_signal("camara_1")
		else:
			print("Solo hay dos cámaras")

func _on_Habitacion_jugador_ha_entrado() -> void:
	cupula.queue_free()

func _on_Habitacion_jugador_ha_salido() -> void:
	var escena_cupula : Spatial = load("res://cupula.tscn").instance()
	call_deferred("add_child", escena_cupula)
	cupula = escena_cupula
	cupula.global_transform.origin = coordenadas_cupula
	
func _on_Tunel_jugador_ha_entrado() -> void:
	habitacion.queue_free()

func _on_Tunel_jugador_ha_salido() -> void:
	var escena_habitacion : Spatial = load("res://Habitacion.tscn").instance()
	escena_habitacion.connect("jugador_ha_entrado",self,"_on_Habitacion_jugador_ha_entrado")
	escena_habitacion.connect("jugador_ha_salido",self,"_on_Habitacion_jugador_ha_salido")
	call_deferred("add_child", escena_habitacion)
	habitacion = escena_habitacion
	escena_habitacion.global_transform.origin = coordenadas_habitacion
