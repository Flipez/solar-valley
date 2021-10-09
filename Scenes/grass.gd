extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_grass_mouse_entered():
	var highlight_material = load("res://Scenes/grass.material")
	highlight_material.emission_enabled = true
	highlight_material.emission = Color(125, 125, 125)
	get_children()[0].get_children()[0].set_material_override(highlight_material)
	print('mouse entered', self)


func _on_grass_mouse_exited():
	get_children()[0].get_children()[0].set_material_override(null)
