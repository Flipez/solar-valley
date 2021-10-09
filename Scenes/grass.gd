extends Spatial

var is_hovered = false
var type = "grass"

func _ready():
	$tmpParent/building_house.visible = false
	$tmpParent/building_sheep.visible = false
	$tmpParent/grass.visible = true
	pass
	
func tick():
	pass

func _process(delta):
	pass

func _on_grass_mouse_entered():
	var highlight_material = load("res://Scenes/highlight.material")
	highlight_material.emission_enabled = true
	highlight_material.emission = Color(125, 125, 125)
	get_children()[0].get_children()[0].set_material_override(highlight_material)
	if Statistics.selected_type == "plant":
		$tmpParent/building_sheep.visible = true	
		$tmpParent/building_house.visible = false
	elif Statistics.selected_type == "house":
		$tmpParent/building_sheep.visible = false	
		$tmpParent/building_house.visible = true
	$tmpParent/grass.visible = false
	is_hovered = true


func _on_grass_mouse_exited():
	get_children()[0].get_children()[0].set_material_override(null)
	$tmpParent/building_house.visible = false
	$tmpParent/building_sheep.visible = false
	$tmpParent/grass.visible = true
	is_hovered = false

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == BUTTON_LEFT and is_hovered:
			var hex
			if Statistics.selected_type == "plant":
				hex = load("res://Scenes/building_sheep.tscn").instance()
			elif Statistics.selected_type == "house":
				hex = load("res://Scenes/building_house.tscn").instance()
				hex.connect("more_people", Statistics, "more_people")
			hex.set_translation(translation)
			get_parent().add_child(hex)
			queue_free()





