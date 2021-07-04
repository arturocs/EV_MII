extends Spatial

var cerca := false
onready var tapon := $"../Tapon"

func _process(_delta : float) -> void:
	if Input.is_action_just_pressed("click") and cerca:
		tapon.accion()

func _on_Area_body_entered(body : PhysicsBody) -> void:
	if body.name == "Player":
		cerca = true


func _on_Area_body_exited(body : PhysicsBody) -> void:
	if body.name == "Player":
		cerca = false
