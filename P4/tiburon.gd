extends Spatial

# Por alguna razon, a pesar de que he marcado que la animacion se reproduzca 
# en bucle, sin este codigo la animacion de nado del tiburon solo se reproduce una vez
func _process(_delta):
	if not $AnimationPlayer.is_playing():
		$AnimationPlayer.play("Take 001")
