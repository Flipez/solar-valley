extends MarginContainer
# https://www.youtube.com/watch?v=Jjv2MWbQVhs

const new_game = preload("res://Scenes/main.tscn")

onready var selector_new      = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/selector
onready var selector_load     = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/selector
onready var selector_control  = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/selector
onready var selector_tutorial = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer4/HBoxContainer/selector
onready var selector_exit     = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer5/HBoxContainer/selector

var current_selection = 0

func _ready():
  set_current_selection(0)


func _process(delta):
  if Input.is_action_just_pressed("ui_down") && (current_selection < 4):
    current_selection += 1
    set_current_selection(current_selection)
  elif Input.is_action_just_pressed("ui_up") && (current_selection > 0):
    current_selection -= 1
    set_current_selection(current_selection)
  elif Input.is_action_just_pressed("ui_accept"):
    handle_selection(current_selection)
    

func handle_selection(current_selection):
  match current_selection:
    0: 
      get_parent().add_child(new_game.instance())
      queue_free()
    4:
      get_tree().quit()


func set_current_selection(current_selection):
  selector_new.text = ""
  selector_load.text = ""
  selector_control.text = ""
  selector_tutorial.text = ""
  selector_exit.text = ""
  match current_selection:
    0:
      selector_new.text = ">"
    1:
      selector_load.text = ">"
    2:
      selector_control.text = ">"
    3:
      selector_tutorial.text = ">"
    4:
      selector_exit.text = ">"
