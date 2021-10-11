extends Node

export var money     : float
export var people    : int

export var selected_type = "plant"

func _ready():
  money     = 20000 # change to 200 before submitting game
  people    = 0


func _process(delta):
  money += people * delta


func update_people(amount):
  people += amount
