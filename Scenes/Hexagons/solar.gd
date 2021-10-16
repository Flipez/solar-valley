extends Area

onready var influence_range = $influence_range
onready var label           = $Spatial
onready var label_text      = $Spatial/Viewport/Label


func _ready():
  label.visible = false


func tick():
  pass


func houses():
  var surrounding_houses = 0
  for body in influence_range.get_overlapping_areas():
    if body.is_in_group("house"):
      surrounding_houses += 1
  return surrounding_houses


func set_hover_text():
  label_text.text = "surrounding houses: " + String(houses())


func _on_Spatial_mouse_entered():
  set_hover_text()
  label.visible = true


func _on_Spatial_mouse_exited():
  label.visible = false

