extends Spatial

onready var hexagons = $hexagons
onready var tick_timer = $Timer

func _ready():
	var placeholder = load("res://Scenes/Hexagons/placeholder.tscn")
	tick_timer.start()
	
	for i in range( -8,8):
		for j in range (-5,5):
			var new_placeholder = placeholder.instance()
			new_placeholder.set_translation(Vector3(i, 0, 1.732*j))
			hexagons.add_child(new_placeholder)
			var new_placeholder2 = placeholder.instance()
			new_placeholder2.set_translation(Vector3(i+0.5, 0, 0.866+1.732*j))
			hexagons.add_child(new_placeholder2)


func _on_Timer_timeout():
	print("tick")
	for hex in hexagons.get_children():
		hex.tick()
