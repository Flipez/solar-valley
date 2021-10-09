extends Area

var surrounding_plants = 0
export var elapsed_ticks = 0
var people = 1
signal more_people

onready var influence_range = $influence_range

func _ready():
	emit_signal("more_people")


func plants():
	surrounding_plants = 0
	for body in influence_range.get_overlapping_areas():
		if body.is_in_group("plant"):
			surrounding_plants += 1


func tick():
	print("house tick: ", self)
	elapsed_ticks +=1
	if (elapsed_ticks % 30 == 0) && people < 10:
		people += 1
		emit_signal("more_people")


func _on_building_house_mouse_entered():
	plants()
	print(surrounding_plants)
