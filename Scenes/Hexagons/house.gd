extends Area

var surrounding_plants = 0
var surrounding_solar = 0
export var elapsed_ticks = 0
var people = 1
signal more_people

onready var influence_range = $influence_range
onready var label           = $Spatial
onready var label_text      = $Spatial/Viewport/Label

func _ready():
  emit_signal("more_people")


func plants():
  surrounding_plants = 0
  for body in influence_range.get_overlapping_areas():
    if body.is_in_group("plant"):
      surrounding_plants += 1


func solar():
  surrounding_solar = 0
  for body in influence_range.get_overlapping_areas():
    if body.is_in_group("solar"):
      surrounding_solar += 1
      

func tick():
  elapsed_ticks +=1
  if (elapsed_ticks % 30 == 0) && people < 10:
    people += 1
    emit_signal("more_people")


func _on_building_house_mouse_entered():
  print ("touching house")
  plants()
  solar()
  label_text.text = "inhabitants: " + String(people) + "/10\n" \
                    + "surrounding plants: " + String(surrounding_plants) + "\n" \
                    + "enough energy: " + String(surrounding_solar)
  $Spatial.visible = true


func _on_building_house_mouse_exited():
  $Spatial.visible = false
