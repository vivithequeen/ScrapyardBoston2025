extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	rotation.x+=6/ 3
	rotation.y+=6/ 3
	rotation.z+=6/ 3