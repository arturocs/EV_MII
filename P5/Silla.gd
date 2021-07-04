extends RigidBody

var cerca := false
var player : KinematicBody
var llevando_silla := false


func _physics_process(_delta:float) -> void:
	if Input.is_action_just_pressed("click"):
		if llevando_silla:
			llevando_silla = false
			rotation = Vector3(0,rotation.y,0)
			apply_central_impulse(Vector3(0,1,0))
		elif cerca and not llevando_silla:
			llevando_silla = true
	if llevando_silla:
		global_transform=player.get_child(2).get_child(1).global_transform

	
func _on_Area_body_entered(body : PhysicsBody) -> void:
	if body.name == "Player":
		player = body
		cerca = true

func _on_Area_body_exited(body : PhysicsBody) -> void:
	if body.name == "Player":
		cerca = false
