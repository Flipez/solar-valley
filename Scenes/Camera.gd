extends Camera

export var zoomSpeed = 5
export var moveSpeed = 0.1
export var zoom_max  = 4
export var zoom_min  = 1.5

# Declare member variables here.
var dragging = false


func _ready():
  set_process_input(true)


func _process(_delta):
  pass


func _input(event):
  if event is InputEventMouseButton:
    if event.is_pressed() and event.button_index == BUTTON_RIGHT:
      dragging = true
    else:
      dragging = false
  elif event is InputEventMouseMotion and dragging:
     translation += Vector3(-event.relative.x, 0, -event.relative.y) * moveSpeed
  
  if event is InputEventMouseButton:
    if event.is_pressed():
      print("translation: ", self.translation)
      print("transform.basis.z: ", transform.basis.z)
      print("self.translation.z: ", self.translation.z)
      # zoom in
      if (event.button_index == BUTTON_WHEEL_UP) and (self.translation.y > zoom_min):
        self.translation -= transform.basis.z
      # zoom out
      if (event.button_index == BUTTON_WHEEL_DOWN) and (self.translation.y < zoom_max):
        self.translation += transform.basis.z
    
