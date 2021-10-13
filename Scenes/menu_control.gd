extends MarginContainer


func _ready():
  pass # Replace with function body.


#func _process(delta):
#  pass


func _on_back_pressed():
  get_tree().change_scene("res://Scenes/main_menu.tscn")
