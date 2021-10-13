extends Spatial

onready var hexagons = $hexagons
onready var tick_timer = $Timer
onready var directional_light = $DirectionalLight

export var sun_speed = 1

func _ready():
  directional_light.rotation_degrees.y = 360
  var placeholder = load("res://Scenes/Hexagons/placeholder.tscn")
  var house       = load("res://Scenes/Hexagons/house.tscn")
  var mountain    = load("res://Scenes/Hexagons/mountain.tscn")
  tick_timer.start()

  for i in range( -10,10):
    for j in range (-6,6):
      var new_placeholder
      var new_placeholder2
      if i == 0 and j == 0:
        new_placeholder2 = placeholder.instance()
        new_placeholder2.set_translation(Vector3(i+0.5, 0, 0.866+1.732*j))
        hexagons.add_child(new_placeholder2)
        new_placeholder = house.instance()
        new_placeholder.connect("update_people", Statistics, "update_people")
        new_placeholder.set_translation(Vector3(i, 0, 1.732*j))
        hexagons.add_child(new_placeholder)
        continue
      else:
        if (abs(i) + abs(j) > 9) or (abs(j) > 4) or (abs(i) > 8):
          new_placeholder = mountain.instance()
          new_placeholder2 = mountain.instance()
        else:
          new_placeholder2 = placeholder.instance()
          new_placeholder = placeholder.instance()
        new_placeholder2.set_translation(Vector3(i+0.5, 0, 0.866+1.732*j))
        hexagons.add_child(new_placeholder2)
        new_placeholder.set_translation(Vector3(i, 0, 1.732*j))
        hexagons.add_child(new_placeholder)

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
