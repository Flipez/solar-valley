extends MarginContainer

var current_selection = 0

func _ready():
  pass


func _process(_delta):
  pass


func _on_new_pressed():
    var _return = get_tree().change_scene("res://Scenes/main.tscn")


func _on_tutorial_pressed():
    var _return = get_tree().change_scene("res://Scenes/menu_tutorial.tscn")


func _on_controls_pressed():
  var _return = get_tree().change_scene("res://Scenes/menu_control.tscn")


func _on_exit_pressed():
  get_tree().quit()
