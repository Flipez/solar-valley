extends Spatial

onready var hexagons = $hexagons
onready var tick_timer = $Timer
onready var directional_light = $DirectionalLight

var sun_speed      = -20
var max_sun_energy = 4

func _ready():
  directional_light.rotation_degrees.y = 360-(7*15)-150 #  begin at 7 o'clock
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
  var energy = max_sun_energy
  directional_light.rotation_degrees.y += sun_speed * delta
  
  # set back rotation degrees into positive area
  if rotation <= 0:
    directional_light.rotation_degrees.y = 360
  
  Statistics.update_clock(360 - directional_light.rotation_degrees.y)
  # the circle has 360 degrees
  # the day has 24 hours
  # --> one hour is 15 degrees
  # define 0° as 0 o'clock, then times and degrees are easy to calculate
  
  ## set energy
  #the following fomula is a stretched & shifted parabula with certain parameters
  var a = 13 # time of the mid of the day
  var b = 8  # distance of end and beginning of the night from mid of the day in hours
  var c = 28 # parameter to slow the sunrising and sunset time down
  var y = (-pow(Statistics.clock - a,2)+pow(b,2))/(c/max_sun_energy)
  energy = min(max(y, 0), max_sun_energy)
  
  directional_light.light_energy = energy
    
  if energy <= 1.5:
    if Statistics.night == false:
      Statistics.night = true
  else:
    if Statistics.night == true:
      Statistics.night = false
