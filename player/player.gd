extends VehicleBody3D


const MAX_STEER = 0.9
const ENGINE_POWER = 300
const WHEEL_TURN = deg_to_rad(32.7)
var paused : bool = false
func _ready():
	update_mouse_mode()


var front_wheel_steer = 0

func _physics_process(delta):
	if Input.is_action_just_pressed("flip"):
		flip()
	var tween = get_tree().create_tween()
	var meow = Vector3(0,0, Input.get_axis("left", "right") * WHEEL_TURN )
	tween.tween_property($wheel, "rotation", meow, 0.5)
	front_wheel_steer = move_toward(front_wheel_steer, Input.get_axis("right", "left") * MAX_STEER, delta * 10)
	$front1.steering = front_wheel_steer
	$front2.steering = front_wheel_steer
	engine_force = Input.get_axis("down", "up") * ENGINE_POWER * (2 if Input.is_action_pressed("shift") else 1)

	#movement
	$wheel/Node3D/Label3D.text = str(int(abs(linear_velocity.x)))
	if Input.is_action_just_pressed("esc"):
		paused = !paused
	if Input.is_action_just_pressed("r"):
		get_tree().change_scene_to_file("res://main_menu/main.tscn")


	#print(engine_force)



func update_mouse_mode():
	
	if paused:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func flip():
	apply_impulse(Vector3.UP * 100)


func _on_timer_timeout():
	$MeshInstance3D3/AudioStreamPlayer3D.stream = load(["res://sam (1).wav", "res://sam.wav"].pick_random())
	$MeshInstance3D3/AudioStreamPlayer3D.play()
	$Timer.wait_time = randi_range(5,15)
	$Timer.start()


func _on_audio_stream_player_finished():
	$AudioStreamPlayer.stream = load(["res://IMG_3598.wav", "res://IMG_3599a.wav","res://20250315_125854.wav"].pick_random())
	$AudioStreamPlayer.play()
