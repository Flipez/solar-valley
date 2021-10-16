extends Node

export var money     : float
export var people    : int
export var night  = true

var show_desciption = false
var description_text = ""
var description_height = 192

var clock = 0

export var selected_type = "plant"

func _ready():
  money     = 20000 # change to 200 before submitting game
  people    = 0


func update_clock(degree):
  # the circle has 360 degrees
  # the day has 24 hours
  # --> one hour is 15 degrees
  clock = fposmod((degree-150), 360) / 15


func _process(delta):
  money += people * delta


func update_people(amount):
  people += amount
