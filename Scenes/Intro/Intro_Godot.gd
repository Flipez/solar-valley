extends MarginContainer

func _ready():
  pass # Replace with function body.


func _on_Timer_timeout():
  var _return = get_tree().change_scene("res://Scenes/main_menu.tscn")
