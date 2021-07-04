extends Spatial

const GRAVEDAD := 9.8
const ANGULO := deg2rad(80)
const VELOCIDAD := 2.0
var t := 0.0

func _process(delta:float):
	if Input.is_action_pressed("ui_left"):
		rotate_y(delta)
	if Input.is_action_pressed("ui_right"):
		rotate_y(-delta)
	if Input.is_action_pressed("ui_accept") or translation.y !=0:
		t += delta
		var x := VELOCIDAD * t * cos(ANGULO)
		var y := VELOCIDAD * t * sin(ANGULO) - 0.5 * GRAVEDAD * t * t
		translate(Vector3(x, y, 0))
	if translation.y < 0:
		translation.y = 0.0
		t = 0.0
