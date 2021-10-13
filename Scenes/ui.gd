extends Control

func _process(_delta):
  $MoneyLabel.text = "%04d" % Statistics.money
  $PeopleLabel.text = "%03d" % Statistics.people
  $ClockLabel.text = "%d o'clock" % Statistics.clock

func _on_PlantsButton_pressed():
  Statistics.selected_type = "plant"
  $ButtonBackground/BuildSelection/PlantsButton.pressed = true
  $ButtonBackground/BuildSelection/HouseButton.pressed = false
  $ButtonBackground/BuildSelection/SolarButtton.pressed = false
  $ButtonBackground/BuildSelection/WellButton.pressed = false

func _on_HouseButton_pressed():
  Statistics.selected_type = "house"
  $ButtonBackground/BuildSelection/PlantsButton.pressed = false
  $ButtonBackground/BuildSelection/HouseButton.pressed = true
  $ButtonBackground/BuildSelection/SolarButtton.pressed = false
  $ButtonBackground/BuildSelection/WellButton.pressed = false

func _on_SolarButtton_pressed():
  Statistics.selected_type = "solar"
  $ButtonBackground/BuildSelection/PlantsButton.pressed = false
  $ButtonBackground/BuildSelection/HouseButton.pressed = false
  $ButtonBackground/BuildSelection/SolarButtton.pressed = true
  $ButtonBackground/BuildSelection/WellButton.pressed = false

func _on_WellButton_pressed():
  Statistics.selected_type = "well"
  $ButtonBackground/BuildSelection/PlantsButton.pressed = false
  $ButtonBackground/BuildSelection/HouseButton.pressed = false
  $ButtonBackground/BuildSelection/SolarButtton.pressed = false
  $ButtonBackground/BuildSelection/WellButton.pressed = true
