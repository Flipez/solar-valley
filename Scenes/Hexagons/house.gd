extends Area

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


func hex_plants():
  var surrounding_hex_plants = 0
  for body in influence_range.get_overlapping_areas():
    if body.is_in_group("plant"):
      surrounding_hex_plants += 1
  return surrounding_hex_plants
  
func enough_plants_available():
  if hex_plants() == 0:
    return false
  
  var required_plants = people / hex_plants()

  for body in influence_range.get_overlapping_areas():
    if body.is_in_group("plant"):
      if required_plants > body.get_parent().available_plants():
        return false
  return true


func solar():
  var surrounding_solar = 0
  for body in influence_range.get_overlapping_areas():
    if body.is_in_group("solar"):
      surrounding_solar += 1
  return surrounding_solar


func tick():
  elapsed_ticks +=1
  if label.visible:
    set_hover_text()

  ##logic to calculate max people
  var n = 4
  if (hex_plants() > 0):
    n += 3
  solar()
  if (solar() > 0):
    n += 3
  # watch out: the sum of n should not exceed 10!
  if n > 10:
    print("plant_1.gd: n is > 10")
  if (elapsed_ticks % 10 == 0) && people < n:
    if enough_plants_available():
      update_people(+1)
    else:
      update_people(-1)


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

func set_hover_text():
  label_text.text = "inhabitants: " + String(people) + "/10\n" \
                    + "Consumes " + String(people) + " plants/s\n" \
                    + "surrounding plants: " + String(hex_plants()) + "\n" \
                    + "enough energy: " + String(solar())

func _on_building_house_mouse_entered():
  label.visible = true


func _on_building_house_mouse_exited():
  label.visible = false
