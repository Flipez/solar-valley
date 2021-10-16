extends Spatial


onready var ghost = $tmpParent/building_farm/ghost


func _ready():
  ghost.visible = false


func _process(_delta):
  if Statistics.clock == 0:
    ghost.visible = true
    $tmpParent/building_farm/ghost/AnimationPlayer.play("circling")
  

func tick():
  pass


func _on_AnimationPlayer_animation_finished(_anim_name):
  ghost.visible = false
