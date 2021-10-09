extends Area

var surrounding_plants = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func sheeps():
	surrounding_plants = 0
	for body in $influence_range.get_overlapping_areas():
		if body.is_in_group("plant"):
			surrounding_plants += 1
		
func _on_building_house_mouse_entered():
	sheeps()
	print(surrounding_plants)
