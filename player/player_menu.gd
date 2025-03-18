extends VehicleBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	await get_tree().create_timer(2).timeout
	apply_impulse(Vector3.UP * 100)
	rotation.x += 3
	rotation.y += 2
	rotation.z += 4