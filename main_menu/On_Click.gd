extends TextureButton

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
