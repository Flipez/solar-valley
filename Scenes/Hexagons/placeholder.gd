extends Spatial

var is_hovered = false
var type = "grass"

var plant_1_preload   = preload("res://Scenes/Hexagons/plant_1.tscn")
var house_preload     = preload("res://Scenes/Hexagons/house.tscn")
var solar_preload     = preload("res://Scenes/Hexagons/solar.tscn")
var well_preload       = preload("res://Scenes/Hexagons/well.tscn")
var graveyard_preload  = preload("res://Scenes/Hexagons/graveyard.tscn")

var cost_plant = 100
var cost_house = 200
var cost_solar = 300
var cost_well  = 300

onready var house_mesh   = $tmpParent/building_house
onready var plant_1_mesh = $tmpParent/building_plant_1
onready var solar_mesh   = $tmpParent/solarpanel
onready var grass_mesh   = $tmpParent/grass
onready var well_mesh    = $tmpParent/building_well

func _ready():
  set_default_visibility()


func tick():
  pass


func set_default_visibility():
  house_mesh.visible   = false
  plant_1_mesh.visible = false
  solar_mesh.visible   = false
  well_mesh.visible    = false
  grass_mesh.visible   = true


func _process(_delta):
  if Input.is_action_just_pressed("ui_rotate") and is_hovered:
    rotate_y(PI/3)


func _on_grass_mouse_entered():
  match Statistics.selected_type:
    "plant":
      plant_1_mesh.visible = true	
      house_mesh.visible   = false
      solar_mesh.visible   = false
      well_mesh.visible    = false
    "house":
      plant_1_mesh.visible = false	
      house_mesh.visible   = true
      solar_mesh.visible   = false
      well_mesh.visible    = false
    "solar":
      house_mesh.visible   = false
      plant_1_mesh.visible = false
      solar_mesh.visible   = true
      well_mesh.visible    = false
    "well":
      solar_mesh.visible   = false
      plant_1_mesh.visible = false
      house_mesh.visible   = false
      well_mesh.visible    = true
  grass_mesh.visible = false
  is_hovered = true


func _on_grass_mouse_exited():
  set_default_visibility()
  is_hovered = false


func _input(event):
  if event is InputEventMouseButton:
    if event.is_pressed() and event.button_index == BUTTON_LEFT and is_hovered:
      var hex
      print(Statistics.clock)
      if Statistics.clock > 0 and Statistics.clock < 3:
        buy_hexagon(graveyard_preload.instance(), 0)
      else:
        match Statistics.selected_type:
          "plant":
            buy_hexagon(plant_1_preload.instance(), cost_plant)
          "house":
            hex = house_preload.instance()
            hex.connect("update_people", Statistics, "update_people")
            buy_hexagon(hex, cost_house)
          "solar":
            buy_hexagon(solar_preload.instance(), cost_solar)
          "well":
            buy_hexagon(well_preload.instance(), cost_well)


func buy_hexagon(hexagon, cost):
  if (Statistics.money >= cost):
    Statistics.money -= cost
    hexagon.set_translation(translation)
    hexagon.set_rotation(rotation)
    get_parent().add_child(hexagon)
    Audio.play_placement()
    queue_free()
