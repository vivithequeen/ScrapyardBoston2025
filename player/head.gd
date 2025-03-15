extends Node3D

@onready var camera : Camera3D = $Camera3D

var look_sense := 0.0025 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):

	if event is InputEventMouseMotion:
		if not get_parent().paused:
			rotate_y( - event.relative.x * look_sense)
			print(camera.rotation.x)


			rotation.y = clamp(rotation.y, deg_to_rad(-110), deg_to_rad(110))
