extends Spatial

onready var hexagons = $hexagons
onready var tick_timer = $Timer

func _ready():
  var placeholder = load("res://Scenes/Hexagons/placeholder.tscn")
  var house       = load("res://Scenes/Hexagons/house.tscn")
  var mountain    = load("res://Scenes/Hexagons/mountain.tscn")
  tick_timer.start()

  for i in range( -8,8):
    for j in range (-5,5):
      var new_placeholder
      var new_placeholder2
      if i == 0 and j == 0:
        new_placeholder2 = placeholder.instance()
        new_placeholder2.set_translation(Vector3(i+0.5, 0, 0.866+1.732*j))
        hexagons.add_child(new_placeholder2)
        new_placeholder = house.instance()
        new_placeholder.connect("more_people", Statistics, "more_people")
        new_placeholder.set_translation(Vector3(i, 0, 1.732*j))
        hexagons.add_child(new_placeholder)
        continue
      else:
        if (abs(i) + abs(j) > 9):
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
