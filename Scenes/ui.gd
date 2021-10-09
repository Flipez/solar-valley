extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$SelectionBackground.rect_position = $BuildSelection.rect_position
	$SelectionBackground.rect_size = $BuildSelection.rect_size
	$SelectionBackground.rect_scale = $BuildSelection.rect_scale
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_PlantsButton_pressed():
	Statistics.selected_type = "plant"
	$BuildSelection/PlantsButton.pressed = true
	$BuildSelection/HouseButton.pressed = false
	$BuildSelection/SolarButtton.pressed = false
	#$SelectionHighlight.rect_position = $BuildSelection/PlantsButton.rect_position
	#$SelectionHighlight.rect_size = $BuildSelection/PlantsButton.rect_size
	#$SelectionHighlight.rect_scale = $BuildSelection/PlantsButton.rect_scale

func _on_HouseButton_pressed():
	Statistics.selected_type = "house"
	$BuildSelection/PlantsButton.pressed = false
	$BuildSelection/HouseButton.pressed = true
	$BuildSelection/SolarButtton.pressed = false
	#$SelectionHighlight.rect_position = $BuildSelection/HouseButton.rect_position
	#$SelectionHighlight.rect_size = $BuildSelection/HouseButton.rect_size
	#$SelectionHighlight.rect_scale = $BuildSelection/HouseButton.rect_scale


func _on_SolarButtton_pressed():
	Statistics.selected_type = "solor"
	$BuildSelection/PlantsButton.pressed = false
	$BuildSelection/HouseButton.pressed = false
	$BuildSelection/SolarButtton.pressed = true
	#$SelectionHighlight.rect_size = $BuildSelection/SolarButton.rect_size
	#$SelectionHighlight.rect_scale = $BuildSelection/SolarButton.rect_scale
