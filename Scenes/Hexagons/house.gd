extends Area

var surrounding_plants   = 1 # 1 avoids dividiing by zero in plant_1.gd
var surrounding_solar    = 0
export var elapsed_ticks = 0
var people               = 0

signal update_people

onready var influence_range = $influence_range
onready var label           = $Spatial
onready var label_text      = $Spatial/Viewport/Label
onready var smoke           = $tmpParent/building_house/Smoke


func _ready():
  smoke.rotation.y -= rotation.y
  update_people(1)


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
  ## increase people
  elapsed_ticks +=1
  var n = 4
  plants()
  if (surrounding_plants > 0):
    n += 3
  solar()
  if (surrounding_solar > 0):
    n += 3
  # watch out: the sum of n should not exceed 10!
  if n > 10:
    print("plant_1.gd: n is > 10")
  if (elapsed_ticks % 10 == 0) && people < n:
    update_people(+1)


func update_people(amount):
  if ((people + amount) <= 0):
    emit_signal("update_people", people - 1)
    people = 1
  elif ((people + amount) > 10):
    emit_signal("update_people", 10 - people)
    people = 10
  else:
    people += amount
    emit_signal("update_people", amount)


func _on_building_house_mouse_entered():
  plants()
  solar()
  label_text.text = "inhabitants: " + String(people) + "/10\n" \
                    + "surrounding plants: " + String(surrounding_plants) + "\n" \
                    + "enough energy: " + String(surrounding_solar)
  $Spatial.visible = true


func _on_building_house_mouse_exited():
  $Spatial.visible = false
