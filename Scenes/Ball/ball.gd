extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var angle: float = 0.0
var radius: float = 200.0
var center = Constants.GALAXY_CENTER
var radial_speed: float = -250.0
var initial_radial_speed = -250.0
var angular_speed: float = 0.0
var launched: bool = false

func _process(delta):
	if Input.is_action_just_pressed("start") and not launched:
		launch_ball()
		
	if launched:
		update_ball_movement(delta)
	else:
		stick_ball_to_paddle()
		
	check_border_collision()
	update_position()

func launch_ball():
	launched = true
	angular_speed = randf_range(-PI/3, PI/3)

func update_ball_movement(delta):
	radius += radial_speed * delta
	angle += angular_speed * delta

func stick_ball_to_paddle():
	var paddle_angle = get_parent().get_node("Paddle").angle
	angle = paddle_angle
	radius = Constants.GALAXY_RADIUS - (animated_sprite_2d.sprite_frames.get_frame_texture("rebound", 0).get_height())

func update_position():
	var offset = Vector2(cos(angle), sin(angle)) * radius
	position = center + offset

func check_border_collision():
	var distance = position.distance_to(Constants.GALAXY_CENTER)
	if distance > Constants.GALAXY_RADIUS and launched:
		SignalManager.emit_on_hit_border()
		reset_ball()

func reset_ball():
	launched = false
	radial_speed = initial_radial_speed
	stick_ball_to_paddle()

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Paddle":
		animated_sprite_2d.play("rebound")
		SignalManager.emit_on_scored()
		SoundManager.play_rebound()
		radial_speed *= -1
		radial_speed *= 1.02
		radial_speed = sign(radial_speed) * abs(radial_speed)
