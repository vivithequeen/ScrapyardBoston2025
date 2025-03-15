extends Node2D
class_name pathPoint

@export var isTarget := false
@export var isStart := false
@export var connections := []
@export var used := false

var target: pathPoint
#var dist: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while target == null:
		print("waiting")
		findTarget()
	#findTarget()

func getNextPoint() -> pathPoint:
	var nextNode := self
	
	var t = randi_range(0, len(connections)-1)
	nextNode = get_node(connections[t])
	return nextNode

func findTarget():
	if not isTarget:
		for point in get_parent().get_children():
			if (point is pathPoint) and point.isTarget:
				target = point
	else:
		target = self


func arrIdxOf(arr: Array, x: Variant) -> int:
	for i in len(arr):
		if arr[i] == x:
			return i
	return -1
