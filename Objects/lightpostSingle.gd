extends Spatial

onready var timer = Timer.new()
onready var light = $OmniLight
onready var lightpost = $RootNode/lightpostSingle

var active = false
var normal_light_energy = 1.5

func _ready():
  randomize()
  
  lightpost.mesh.surface_get_material(2).set_emission(Color(242, 235, 79))
  
  timer.autostart = true
  timer.wait_time = 1
  timer.connect("timeout",self,"_on_timer_timeout")
  add_child(timer)


func _process(_delta):
  if Statistics.night == true and active == false:
    enable_light()
  elif Statistics.night == false and active == true:
    disable_light()


func enable_light():
  timer.start()
  active = true
  light.light_energy = normal_light_energy
  lightpost.mesh.surface_get_material(2).set_feature(1, true)


func disable_light():
  active = false
  timer.stop()
  light.light_energy = 0
  lightpost.mesh.surface_get_material(2).set_feature(1, false)


func _on_timer_timeout():
  if light.light_energy == normal_light_energy:
    light.light_energy = rand_range(1.2, normal_light_energy)
    timer.wait_time = 0.1
  else:
    light.light_energy = normal_light_energy
    timer.wait_time = rand_range(1.8, 2.2)
    
  timer.start()
