extends Area

var surrounding_houses = 0

onready var influence_range = $influence_range
onready var label           = $Spatial
onready var label_text      = $Spatial/Viewport/Label


func _ready():
  $Spatial.visible = false


func tick():
  pass


func houses():
  surrounding_houses = 0
  for body in influence_range.get_overlapping_areas():
    if body.is_in_group("house"):
      surrounding_houses += 1


func _on_Spatial_mouse_entered():
  houses()
  label_text.text = "surrounding houses: " + String(surrounding_houses)
  $Spatial.visible = true


func _on_Spatial_mouse_exited():
  $Spatial.visible = false

