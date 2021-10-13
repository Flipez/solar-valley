#change these!
var speed=.2
const change_color_range=PI/8

onready var white_sun=get_node("white_sun")
onready var yellow_sun=get_node("yellow_sun")


func _ready():
    set_process(true)

func _process(delta):
    #get the current rotation, and move it a bit...
    var new_rotation=get_rotation()
    new_rotation.z+=(PI*speed)*delta

    #make sure it's in the range 0 to 2PI...
    if(new_rotation.z>2*PI):
        new_rotation.z-=2*PI
    elif(new_rotation.z<0):
        new_rotation.z+=2*PI

    #set it...
    set_rotation(new_rotation)

    #Now we turn one, the other, or both suns off.
    if(new_rotation.z>2*PI-change_color_range):
        yellow_sun.set_hidden(false)
        white_sun.set_hidden(true)
    elif(new_rotation.z>PI and new_rotation.z<PI+change_color_range):
        yellow_sun.set_hidden(false)
        white_sun.set_hidden(true)
    elif(new_rotation.z<PI):
        yellow_sun.set_hidden(true)
        white_sun.set_hidden(true)
    else:
        yellow_sun.set_hidden(true)
        white_sun.set_hidden(false)
