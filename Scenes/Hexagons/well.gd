extends Area

var surrounding_plants = 0

onready var influence_range = $influence_range


func _ready():
  pass # Replace with function body.


func tick():
  pass
  
  
func plants():
  surrounding_plants = 0
  for body in influence_range.get_overlapping_areas():
    if body.is_in_group("plant"):
      surrounding_plants += 1


func _on_well_mouse_entered():
  pass # Replace with function body.
