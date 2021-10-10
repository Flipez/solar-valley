extends Area

var surrounding_houses    = 0
var surrounding_wells     = 0
export var elapsed_ticks  = 0
export var plants : float = 0.0

signal more_plants

onready var influence_range = $influence_range
onready var label           = $Spatial
onready var label_text      = $Spatial/Viewport/Label

func _ready():
  pass


func tick():
  elapsed_ticks +=1
  houses()
  if (elapsed_ticks % 30 == 0) && plants < 10:
    plants += 1


func houses():
  surrounding_houses = 0
  for body in influence_range.get_overlapping_areas():
    if body.is_in_group("house"):
      # increase house counter
      surrounding_houses += 1
      #decrease plant counter
      plants -= body.get_parent().people / 30


func wells():
  surrounding_wells = 0
  for body in influence_range.get_overlapping_areas():
    if body.is_in_group("well"):
      surrounding_wells += 1


func _on_Spatial_mouse_entered():
  houses()
  wells()
  label_text.text = "plants: " + String(plants) + "\n" \
                    + "surrounding houses: " + String(surrounding_houses) + "\n" \
                    + "surrounding wells: " + String(surrounding_wells) 
  $Spatial.visible = true


func _on_Spatial_mouse_exited():
  $Spatial.visible = false
