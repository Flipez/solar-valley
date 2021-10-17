extends Control

onready var plant_button  = $HSplitContainer/MarginContainer/CenterContainer/PanelContainer/VBoxContainer/PlantButton
onready var plant2_button = $HSplitContainer/MarginContainer/CenterContainer/PanelContainer/VBoxContainer/Plant2Button
onready var plant3_button = $HSplitContainer/MarginContainer/CenterContainer/PanelContainer/VBoxContainer/Plant3Button
onready var house_button  = $HSplitContainer/MarginContainer/CenterContainer/PanelContainer/VBoxContainer/HouseButton
onready var solar_button  = $HSplitContainer/MarginContainer/CenterContainer/PanelContainer/VBoxContainer/SolarButton
onready var well_button   = $HSplitContainer/MarginContainer/CenterContainer/PanelContainer/VBoxContainer/WellButton

onready var money_label  = $HSplitContainer/VSplitContainer/HBoxContainer/MoneyLabel
onready var people_label = $HSplitContainer/VSplitContainer/HBoxContainer/PeopleLabel
onready var clock_label  = $HSplitContainer/VSplitContainer/HBoxContainer/ClockLabel

onready var hexagon_label = $HSplitContainer/VSplitContainer/HSplitContainer/VSplitContainer/MarginContainer/NinePatchRect

func _ready():
  Statistics.selected_type = "plant"
  plant_button.pressed  = true
  plant2_button.set_disabled(true)
  plant3_button.set_disabled(true)
  solar_button.set_disabled(true)
  well_button.set_disabled(true)

func _process(_delta):
  money_label.text = "%05d" % Statistics.money
  people_label.text = "%03d" % Statistics.people
  clock_label.text = "%d o'clock" % Statistics.clock
  hexagon_label.visible = Statistics.show_desciption
  if Statistics.people > 20:
    plant2_button.set_disabled(false)
  if Statistics.people > 80:
    plant3_button.set_disabled(false)
  if Statistics.people > 40:
    solar_button.set_disabled(false)
  if Statistics.people > 60:
    well_button.set_disabled(false)
  if hexagon_label.visible:
    hexagon_label.rect_min_size.y = Statistics.description_height
    #hexagon_label.rect_position.y = 580 - Statistics.description_height
    $HSplitContainer/VSplitContainer/HSplitContainer/VSplitContainer/MarginContainer/NinePatchRect/RichTextLabel.text = Statistics.description_text


func _on_HouseButton_pressed():
  Statistics.selected_type = "house"
  plant_button.pressed  = false
  plant2_button.pressed = false
  plant3_button.pressed = false
  house_button.pressed  = true
  solar_button.pressed  = false
  well_button.pressed   = false


func _on_WellButton_pressed():
  Statistics.selected_type = "well"
  plant_button.pressed  = false
  plant2_button.pressed = false
  plant3_button.pressed = false
  house_button.pressed  = false
  solar_button.pressed  = false
  well_button.pressed   = true


func _on_PlantButton_pressed():
  Statistics.selected_type = "plant"
  plant_button.pressed  = true
  plant2_button.pressed = false
  plant3_button.pressed = false
  house_button.pressed  = false
  solar_button.pressed  = false
  well_button.pressed   = false


func _on_Plant2Button_pressed():
  Statistics.selected_type = "plant2"
  plant_button.pressed  = false
  plant2_button.pressed = true
  plant3_button.pressed = false
  house_button.pressed  = false
  solar_button.pressed  = false
  well_button.pressed   = false


func _on_Plant3Button_pressed():
  Statistics.selected_type = "plant3"
  plant_button.pressed  = false
  plant2_button.pressed = false
  plant3_button.pressed = true
  house_button.pressed  = false
  solar_button.pressed  = false
  well_button.pressed   = false


func _on_SolarButton_pressed():
  Statistics.selected_type = "solar"
  plant_button.pressed  = false
  plant2_button.pressed = false
  plant3_button.pressed = false
  house_button.pressed  = false
  solar_button.pressed  = true
  well_button.pressed   = false
