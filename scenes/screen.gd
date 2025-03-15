extends Node2D


func _physics_process(delta):
	$Sprite2D.position = Vector2(get_parent().get_parent().global_position.x ,get_parent().get_parent().global_position.z )
