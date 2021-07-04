extends Spatial


var bajo_el_chorro := false
onready var efecto_agua : ColorRect = $EfectoAgua
onready var chorro : Particles = $Chorro

func _process(_delta : float) -> void:
	efecto_agua.visible = bajo_el_chorro and chorro.emitting

func _on_AreaBajoElChorro_body_entered(body : PhysicsBody) -> void:
	if body.name == "Player":
		bajo_el_chorro = true

func _on_AreaBajoElChorro_body_exited(body : PhysicsBody) -> void:
	if body.name == "Player":
		bajo_el_chorro = false
