extends MarginContainer


func _on_Timer_timeout():
  var _return = get_tree().change_scene("res://Scenes/Intro/Intro_Godot.tscn")
