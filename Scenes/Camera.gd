extends Camera

export var zoomSpeed = 5
export var moveSpeed = 0.1

# Declare member variables here.
var dragging = false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			dragging = true
		else:
			dragging = false
	elif event is InputEventMouseMotion and dragging:
		 translation += Vector3(-event.relative.x, 0, -event.relative.y) * moveSpeed
	
	if event is InputEventMouseButton:
		if event.is_pressed():
			# zoom in
			if event.button_index == BUTTON_WHEEL_UP:
				fov -= self.zoomSpeed
			# zoom out
			if event.button_index == BUTTON_WHEEL_DOWN:
				fov += self.zoomSpeed
		
		
		
		
		#Camera.position = get_global_mouse_position()
