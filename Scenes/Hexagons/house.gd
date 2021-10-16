extends Area

export var elapsed_ticks = 0
var people               = 0
var max_people           = 4

signal update_people

onready var influence_range = $influence_range
onready var smoke           = $tmpParent/building_house/Smoke

var hovered = false

func _ready():
  smoke.rotation.y -= rotation.y
  update_people(1)


func hex_plants():
  var surrounding_hex_plants = 0
  for body in influence_range.get_overlapping_areas():
    if body.is_in_group("plant"):
      surrounding_hex_plants += 1
  return surrounding_hex_plants
  
func enough_plants_available(mod = 0):
  if hex_plants() == 0:
    return false
  
  var required_plants = (people + mod) / hex_plants()

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


func solar_text():
  if solar() > 0:
    return "Has solar power"
  else:
    return "Has no solar power"
    
func hunger_text():
  if enough_plants_available(1):
    return "Has enough food\n"
  else:
    return "Has not enough food\n"


func tick():
  elapsed_ticks +=1
  if hovered:
    set_hover_text()

  ##logic to calculate max people
  var n = 4
  if (hex_plants() > 0):
    n += 3
  if (solar() > 0):
    n += 3
  max_people = n
  # watch out: the sum of n should not exceed 10!
  if n > 10:
    print("plant_1.gd: n is > 10")
  if (elapsed_ticks % 10 == 0) && people < max_people:
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
  Statistics.description_height = 180
  Statistics.description_text = \
    "Family House: \n\n" \
    + "Inhabitants:  " + String(people) + "/10\n" \
    + "Consumes    " + String(people) + " plants/s\n" \
    + hunger_text() \
    + solar_text()


func _on_building_house_mouse_entered():
  set_hover_text()
  Statistics.show_desciption = true
  hovered = true


func _on_building_house_mouse_exited():
  Statistics.show_desciption = false
  hovered = false

