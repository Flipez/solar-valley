extends Node

export var money     : float
export var energy    : int
export var water     : int
export var happiness : int
export var people    : int
export var plants    : int

export var selected_type = "plant"

func _ready():
  money     = 2000 # change to 200 before submitting game
  energy    = 0
  water     = 0
  happiness = 0
  people    = 0
  plants    = 0


func _process(delta):
  money += people * delta


func more_people():
  people += 1
