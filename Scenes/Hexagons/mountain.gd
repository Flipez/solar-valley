extends Spatial


# Declare member variables here.


func _ready():
  pass # Replace with function body.

func tick():
  pass

func save():
  return {
    type = "mountain",
    transform = {
      pos_x = self.translation.x,
      pos_y = self.translation.y,
      pos_z = self.translation.z,
      rot_x = self.rotation.x,
      rot_y = self.rotation.y,
      rot_z = self.rotation.z,
    },
  }
  pass
