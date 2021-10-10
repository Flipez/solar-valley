extends Control

func _on_PlantsButton_pressed():
	Statistics.selected_type = "plant"
	$ButtonBackground/BuildSelection/PlantsButton.pressed = true
	$ButtonBackground/BuildSelection/HouseButton.pressed = false
	$ButtonBackground/BuildSelection/SolarButtton.pressed = false

func _on_HouseButton_pressed():
	Statistics.selected_type = "house"
	$ButtonBackground/BuildSelection/PlantsButton.pressed = false
	$ButtonBackground/BuildSelection/HouseButton.pressed = true
	$ButtonBackground/BuildSelection/SolarButtton.pressed = false


func _on_SolarButtton_pressed():
	Statistics.selected_type = "solar"
	$ButtonBackground/BuildSelection/PlantsButton.pressed = false
	$ButtonBackground/BuildSelection/HouseButton.pressed = false
	$ButtonBackground/BuildSelection/SolarButtton.pressed = true
