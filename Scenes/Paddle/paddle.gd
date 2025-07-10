extends Node2D

var angle: float = 0.0
var speed: float = PI
var center = Constants.GALAXY_CENTER
var radius = Constants.GALAXY_RADIUS

func _process(delta):
	if Input.is_action_pressed("right"):
		angle -= speed * delta
	if Input.is_action_pressed("left"):
		angle += speed * delta

	var pos_x = center.x + cos(angle) * radius
	var pos_y = center.y + sin(angle) * radius
	position = Vector2(pos_x, pos_y)

	rotation = angle + PI/2
