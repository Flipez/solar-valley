extends Node

export var money = 0
export var energy = 0
export var water = 0
export var happiness = 0
export var people = 1

export var selected_type = "plant"

# Called when the node enters the scene tree for the first time.
func _ready():
  money = 0
  energy = 0
  water = 0
  happiness = 0
  people = 1
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	money += people * 1 * delta
	pass
