extends KinematicBody

export var GRAVITY := -9.8
export var MAX_SPEED := 2
export var JUMP_SPEED := 2.5
export var ACCEL := 4.5
export var DEACCEL := 16
export var MAX_SLOPE_ANGLE := 40
export var MOUSE_SENSITIVITY := 0.1

var vel := Vector3()
var dir := Vector3()
onready var camera : Camera = $RotationHelper/Camera
onready var rotation_helper : Spatial = $RotationHelper

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func process_input(_delta : float) -> void:
	dir = Vector3()
	var cam_xform : Transform = camera.get_global_transform()

	var input_movement_vector := Vector2()

	if Input.is_action_pressed("fpv_delante"):
		input_movement_vector.y += 1
	if Input.is_action_pressed("fpv_detras"):
		input_movement_vector.y -= 1
	if Input.is_action_pressed("fpv_izquierda"):
		input_movement_vector.x += 1
	if Input.is_action_pressed("fpv_derecha"):
		input_movement_vector.x -= 1
	

	input_movement_vector = input_movement_vector.normalized()

	dir += -cam_xform.basis.z.normalized() * input_movement_vector.y
	dir += cam_xform.basis.x.normalized() * input_movement_vector.x

	# Salto
	if is_on_floor():
		if Input.is_action_just_pressed("ui_select"):
			vel.y = JUMP_SPEED

func process_movement(delta : float) -> void:
	dir.y = 0
	dir = dir.normalized()

	vel.y += delta*GRAVITY

	var hvel := vel
	hvel.y = 0

	var target := dir
	target *= MAX_SPEED

	var accel : float
	if dir.dot(hvel) > 0:
		accel = ACCEL
	else:
		accel = DEACCEL

	hvel = hvel.linear_interpolate(target, accel*delta)
	vel.x = hvel.x
	vel.z = hvel.z
	vel = move_and_slide(vel,Vector3(0,1,0), 0.05, 4, deg2rad(MAX_SLOPE_ANGLE))


func _physics_process(delta : float) -> void:
	if Input.is_action_pressed("ui_cancel"):
			get_tree().quit()
	if camera.current:
		process_input(delta)
		process_movement(delta)

func _input(event : InputEvent) -> void:
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotation_helper.rotate_x(-deg2rad(event.relative.y * MOUSE_SENSITIVITY))
		self.rotate_y(-deg2rad(event.relative.x * MOUSE_SENSITIVITY ))

		var camera_rot : Vector3 = rotation_helper.rotation_degrees
		camera_rot.x = clamp(camera_rot.x, -80, 80)
		rotation_helper.rotation_degrees = camera_rot


func _on_P5_camara_1() -> void:
	camera.current=true
