extends Node2D

var mode = "main"
# Called when the node enters the scene tree for the first time.
func _ready():
	update()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func update():
	$CenterContainer/main.visible = mode == "main"
	$CenterContainer/controls.visible = mode == "controls"
	$CenterContainer/settings.visible = mode == "settings"
	if $CenterContainer/settings/HBoxContainer/CheckBox.button_pressed:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_settings_pressed():
	mode = "settings"
	update()


func _on_controls_pressed():
	mode = "controls"
	update()


func _on_quit_pressed():
	get_tree().quit()


func _on_back_pressed():
	mode = "main"
	update()


func _on_check_box_pressed():
	update()
