extends Camera

export var zoomSpeed = 5
export var moveSpeed = 0.1

# Declare member variables here.
var dragging = false


func _ready():
	set_process_input(true)


func _process(delta):
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
			# zoom in
			if event.button_index == BUTTON_WHEEL_UP:
				self.translation -= transform.basis.z
			# zoom out
			if event.button_index == BUTTON_WHEEL_DOWN:
				self.translation += transform.basis.z
		
