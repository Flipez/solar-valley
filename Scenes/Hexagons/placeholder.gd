extends Spatial

var is_hovered = false
var type = "grass"

var plant_1_preload = preload("res://Scenes/Hexagons/plant_1.tscn")
var house_preload   = preload("res://Scenes/Hexagons/house.tscn")
var solar_preload   = preload("res://Scenes/Hexagons/solar.tscn")

onready var house_mesh   = $tmpParent/building_house
onready var plant_1_mesh = $tmpParent/building_plant_1
onready var solar_mesh   = $tmpParent/solarpanel
onready var grass_mesh   = $tmpParent/grass

func _ready():
	set_default_visibility()


func tick():
	pass


func set_default_visibility():
	house_mesh.visible   = false
	plant_1_mesh.visible = false
	solar_mesh.visible   = false
	grass_mesh.visible   = true


func _process(delta):
	if Input.is_action_just_pressed("ui_rotate") and is_hovered:
		rotate_y(PI/3)


func _on_grass_mouse_entered():
	match Statistics.selected_type:
		"plant":
			plant_1_mesh.visible = true	
			house_mesh.visible   = false
			solar_mesh.visible   = false
		"house":
			plant_1_mesh.visible = false	
			house_mesh.visible   = true
			solar_mesh.visible   = false
		"solar":
			solar_mesh.visible   = true
			plant_1_mesh.visible = false
			house_mesh.visible   = false
	grass_mesh.visible = false
	is_hovered = true


func _on_grass_mouse_exited():
	set_default_visibility()
	is_hovered = false


func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == BUTTON_LEFT and is_hovered:
			var hex
			match Statistics.selected_type:
				"plant":
					hex = plant_1_preload.instance()
				"house":
					hex = house_preload.instance()
					hex.connect("more_people", Statistics, "more_people")
				"solar":
					hex = solar_preload.instance()
			hex.set_translation(translation)
			hex.set_rotation(rotation)
			get_parent().add_child(hex)
			queue_free()
