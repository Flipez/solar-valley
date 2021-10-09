extends Spatial


func _ready():
	var grass = load("res://Scenes/placeholder.tscn")
	
	for i in range( -8,8):
		for j in range (-5,5):
			var new_grass = grass.instance()
			new_grass.set_translation(Vector3(i, 0, 1.732*j))
			$hexagons.add_child(new_grass)
			var new_grass2 = grass.instance()
			new_grass2.set_translation(Vector3(i+0.5, 0, 0.866+1.732*j))
			$hexagons.add_child(new_grass2)


func _on_Timer_timeout():
	for hex in $hexagons.get_children():
		hex.tick()
	pass # Replace with function body.
