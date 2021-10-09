extends Node

export var money = 0
export var energy = 0
export var water = 0
export var happiness = 0
export var people = 0

export var selected_type = "plant"

# Called when the node enters the scene tree for the first time.
func _ready():
  money = 0
  energy = 0
  water = 0
  happiness = 0
  people = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	money += people * delta

func more_people():
	people += 1
	print(people)
