extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
  get_tree().paused = true


func _on_continue_pressed():
  get_tree().paused = false
  queue_free()


func _on_save_pressed():
  get_parent().save()


func _on_load_pressed():
  get_parent().load_game()
  get_tree().paused = false
  queue_free()


func _on_exit_pressed():
  get_tree().quit()

