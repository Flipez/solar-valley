extends Area

onready var influence_range = $influence_range

var hovered = false


func tick():
  pass


func houses():
  var surrounding_houses = 0
  for body in influence_range.get_overlapping_areas():
    if body.is_in_group("house"):
      surrounding_houses += 1
  return surrounding_houses


func set_hover_text():
  Statistics.description_text = "surrounding houses: " + String(houses())


func _on_Spatial_mouse_entered():
  set_hover_text()
  Statistics.show_desciption = true
  hovered = true


func _on_Spatial_mouse_exited():
  Statistics.show_desciption = false
  hovered = false
