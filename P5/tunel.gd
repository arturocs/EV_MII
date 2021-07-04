extends Spatial

signal jugador_ha_entrado
signal jugador_ha_salido


func _on_Area_body_entered(body : PhysicsBody) -> void:
	if body.name == "Player":
		emit_signal("jugador_ha_entrado")


func _on_Area_body_exited(body : PhysicsBody) -> void:
	if body.name == "Player":
		emit_signal("jugador_ha_salido")
