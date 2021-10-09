extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var grass = load("res://Scenes/grass.tscn")
	var highlight_material = load("res://Scenes/grass.material")
	highlight_material.emission_enabled = true
	highlight_material.emission = Color(125, 125, 125)
	
	for i in range( -8,8):
		for j in range (-5,5):
			var new_grass = grass.instance()
			new_grass.set_translation(Vector3(i, 0, 1.732*j))
			#new_grass.get_children()[0].get_children()[0].set_material_override(highlight_material)
			#new_grass.get_node("grass").set_material_override(highlight_material)
			add_child(new_grass)
			var new_grass2 = grass.instance()
			new_grass2.set_translation(Vector3(i+0.5, 0, 0.866+1.732*j))
			add_child(new_grass2)
	
const ray_length = 1000

func _physics_process(delta):
  #get_object_under_mouse()
  pass

func get_object_under_mouse():
	var mouse_pos = get_viewport().get_mouse_position()
	var ray_from = $Camera.project_ray_origin(mouse_pos)
	var ray_to = ray_from + $Camera.project_ray_normal(mouse_pos) * ray_length
	var space_state = get_world().direct_space_state
	var selection = space_state.intersect_ray(ray_from, ray_to)
	print(ray_to, ray_from, selection)
	return selection

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
