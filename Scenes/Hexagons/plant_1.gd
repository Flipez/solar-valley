extends Area

export var elapsed_ticks  = 0

export var base_plant_output = 7

onready var influence_range = $influence_range
onready var label           = $Spatial
onready var label_text      = $Spatial/Viewport/Label

func _ready():
  pass


func tick():
  elapsed_ticks +=1
  if label.visible:
    set_hover_text()

func plant_output():
  if wells() > 0:
    return base_plant_output * 2
  return base_plant_output

func houses():
  var surrounding_houses = 0
  for body in influence_range.get_overlapping_areas():
    if body.is_in_group("house"):
      surrounding_houses += 1
  return surrounding_houses


func wells():
  var surrounding_wells = 0
  for body in influence_range.get_overlapping_areas():
    if body.is_in_group("well"):
      surrounding_wells += 1
  return surrounding_wells


func available_plants():
  if houses() == 0:
    return plant_output()
  return plant_output() / houses()


func set_hover_text():
  label_text.text = "Produces " + String(int(plant_output())) + " plants/s\n" \
                    + "surrounding houses: " + String(houses()) + "\n" \
                    + "surrounding wells: " + String(wells())


func _on_Spatial_mouse_entered():
  set_hover_text()
  label.visible = true


func _on_Spatial_mouse_exited():
  label.visible = false
