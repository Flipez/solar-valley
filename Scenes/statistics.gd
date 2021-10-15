extends Node

export var money     : float
export var people    : int
export var night  = true
export var new_game = true

var clock = 0

export var selected_type = "plant"

func _ready():
  money     = 20000 # change to 200 before submitting game
  people    = 0

func update_clock(degree):
  degree = 360 - degree
  var hours = ((1440 / 360) * degree) / 60
  clock = hours

func _process(delta):
  money += people * delta


func update_people(amount):
  people += amount
