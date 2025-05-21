extends Path2D

var possiblePoints := []
var target: pathPoint

func _ready() -> void:
	while target == null:
		print("waiting")
		findTarget()
	
	for i in get_parent().get_children():
		if i is pathPoint:
			possiblePoints.append(i)
	
	makePath()
	mapPath()
	

func makePath():
	var startPoint := getStartPoint()
	var nextPoint := getStartPoint()
	curve.add_point(nextPoint.position)
	nextPoint.used = true
	
	print(target)
	while not nextPoint.isTarget:
		nextPoint = nextPoint.getNextPoint()
		nextPoint.connections.erase(startPoint)
		curve.add_point(nextPoint.position)

func mapPath():
	var line = Line2D.new()
	line.width = 15
	line.default_color = Color.RED
	for i in curve.point_count:
		line.add_point(curve.get_point_position(i))
	add_child(line)

func lineArrow(initPos: Vector2, termPos: Vector2):
	pass

func findTarget():
	for point in get_parent().get_children():
		if (point is pathPoint) and point.isTarget:
			target = point

func getStartPoint() -> pathPoint:
	for i in possiblePoints:
		if i.isStart:
			i.used = true
			return i
	
	return possiblePoints[0]
