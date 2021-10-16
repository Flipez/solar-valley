extends Area

var hovered = false

onready var influence_range = $influence_range

func tick():
  if hovered:
    set_hover_text()
  
  
func plants():
  var surrounding_plants = 0
  for body in influence_range.get_overlapping_areas():
    if body.is_in_group("plant"):
      surrounding_plants += 1
  return surrounding_plants

  
func set_hover_text():
  Statistics.description_text = "surrounding plants: " + String(plants())


func _on_well_mouse_entered():
  set_hover_text()
  Statistics.show_desciption = true
  hovered = true


func _on_well_mouse_exited():
  Statistics.show_desciption = false
  hovered = false
