extends Spatial


# Declare member variables here.


func _ready():
	pass



func _on_grass_mouse_entered():
	var highlight_material = load("res://Scenes/highlight.material")
	highlight_material.emission_enabled = true
	highlight_material.emission = Color(125, 125, 125)
	get_children()[0].get_children()[0].set_material_override(highlight_material)


func _on_grass_mouse_exited():
	get_children()[0].get_children()[0].set_material_override(null)
