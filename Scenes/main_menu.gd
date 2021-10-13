extends MarginContainer

#const new_game = preload("res://Scenes/main.tscn")
#const controls = preload("res://Scenes/menu_control.tscn")

onready var selector_new      = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/New/HBoxContainer/selector
onready var selector_load     = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/Load/HBoxContainer/selector
onready var selector_control  = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/Control/HBoxContainer/selector
onready var selector_tutorial = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/Tutorial/HBoxContainer/selector
onready var selector_exit     = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/Exit/HBoxContainer/selector

var current_selection = 0

func _ready():
  pass


func _process(delta):
  pass


func _on_new_pressed():
    get_tree().change_scene("res://Scenes/menu_control.tscn")


func _on_load_game_pressed():
  pass # Replace with function body.


func _on_tutorial_pressed():
  pass # Replace with function body.


func _on_controls_pressed():
  get_tree().change_scene("res://Scenes/menu_control.tscn")


func _on_exit_pressed():
  get_tree().quit()
