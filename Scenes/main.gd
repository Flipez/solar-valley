extends Spatial

onready var hexagons = $hexagons
onready var tick_timer = $Timer
onready var directional_light = $DirectionalLight

var placeholder_preload = preload("res://Scenes/Hexagons/placeholder.tscn")
var mountain_preload    = preload("res://Scenes/Hexagons/mountain.tscn")
var plant_1_preload     = preload("res://Scenes/Hexagons/plant_1.tscn")
var house_preload       = preload("res://Scenes/Hexagons/house.tscn")
var solar_preload       = preload("res://Scenes/Hexagons/solar.tscn")
var well_preload        = preload("res://Scenes/Hexagons/well.tscn")

export var sun_speed = 1

func _ready():
  directional_light.rotation_degrees.y = 360
  tick_timer.start()

  for i in range( -10,10):
    for j in range (-6,6):
      var new_placeholder
      var new_placeholder2
      if i == 0 and j == 0:
        new_placeholder2 = placeholder_preload.instance()
        new_placeholder2.set_translation(Vector3(i+0.5, 0, 0.866+1.732*j))
        hexagons.add_child(new_placeholder2)
        new_placeholder = house_preload.instance()
        new_placeholder.connect("update_people", Statistics, "update_people")
        new_placeholder.set_translation(Vector3(i, 0, 1.732*j))
        hexagons.add_child(new_placeholder)
        continue
      else:
        if (abs(i) + abs(j) > 9) or (abs(j) > 4) or (abs(i) > 8):
          new_placeholder = mountain_preload.instance()
          new_placeholder2 = mountain_preload.instance()
        else:
          new_placeholder2 = placeholder_preload.instance()
          new_placeholder = placeholder_preload.instance()
        new_placeholder2.set_translation(Vector3(i+0.5, 0, 0.866+1.732*j))
        hexagons.add_child(new_placeholder2)
        new_placeholder.set_translation(Vector3(i, 0, 1.732*j))
        hexagons.add_child(new_placeholder)

func save():
  var save_game = File.new()
  save_game.open("user://savegame.save",File.WRITE)
  
  var main_data = {
    people = Statistics.people,
    money = Statistics.money
  }
  save_game.store_line(to_json(main_data))
  
  for hex in hexagons.get_children():
    save_game.store_line(to_json(hex.save()))

  save_game.close()

func load_transform(object, transformData):
  object.set_translation(Vector3(transformData["pos_x"],transformData["pos_y"],transformData["pos_z"]))
  object.set_rotation(Vector3(transformData["rot_x"],transformData["rot_y"],transformData["rot_z"]))


func load_data():
  for hex in hexagons.get_children():
    hex.queue_free()

  var save_game = File.new()
  save_game.open("user://savegame.save", File.READ)
  var main_data = parse_json(save_game.get_line())
  
  while save_game.get_position() < save_game.get_len():
    var data = parse_json(save_game.get_line())
    var new_object
    match data["type"]:
      "placeholder":
        new_object = placeholder_preload.instance()
      "mountain":
        new_object = mountain_preload.instance()
      "house":
        new_object = house_preload.instance()
        new_object.connect("more_people", Statistics, "more_people")
      "well":
        new_object = well_preload.instance()
      "solar":
        new_object = solar_preload.instance()
      "plant":
        new_object = plant_1_preload.instance()
        
    load_transform(new_object, data["transform"])
    for key in data.keys():
      if key == "type" or key == "transform":
        continue
      new_object.set(key, data[key])
    hexagons.add_child(new_object)

  Statistics.people = main_data["people"]
  Statistics.money = main_data["money"]


func _on_Timer_timeout():
  for hex in hexagons.get_children():
    hex.tick()


func _process(delta):
  var rotation = directional_light.rotation_degrees.y
  var energy = 5
  directional_light.rotation_degrees.y -= sun_speed * delta
  
  if rotation <= 120:
    energy = max((rotation - 50) * 0.07, 0)
  elif rotation >= 290:
    var off = 360 - rotation
    energy = min((off) * 0.07, 5)
  
  directional_light.light_energy = energy
  if rotation <= 0:
    directional_light.rotation_degrees.y = 360
    
  Statistics.update_clock(directional_light.rotation_degrees.y)
    
  if energy <= 1.5:
    if Statistics.night == false:
      Statistics.night = true
  else:
    if Statistics.night == true:
      Statistics.night = false
