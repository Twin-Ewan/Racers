extends KinematicBody2D

var Background_OLD
var background = 0
var wheel_base = 70
var steering_angle = 56
var engine_power = 500
var friction = -2
var drag = -0.001
var braking = -650
var max_speed_reverse = 250
var slip_speed = 400
var traction_fast = 0.1
var traction_slow = 0.7

var acceleration = Vector2.ZERO
var velocity = Vector2.ZERO
var steer_direction
var MulitSpeed = 1

func _physics_process(delta):
	

	acceleration = Vector2.ZERO
	get_input()
	apply_friction()
	calculate_steering(delta)
	set_speed()
	velocity += acceleration * delta
	velocity = move_and_slide(velocity)

	background = get_parent().get_node("Player1").background

	if !background == Background_OLD:
		Background_OLD = background
		Background_Settings()

# Stops the player from going out of bounds and crashing the game
	var screen_size = get_viewport_rect().size
	position.y = clamp(position.y, 0, screen_size.y)
	position.x = clamp(position.x, 0, screen_size.x)

func set_speed():
	
# Gets the texture from the background sprite then assigns it variable "background"

	var Texture = get_node("/root/Node2D/Background/Track").get_texture()
	var data = Texture.get_data()

# Gets the RGBA (Red, Green, Blue, Alpha (Opacity)) from data
	data.lock()
	var RGB = data.get_pixel(position.x,position.y)
	data.unlock()

# Converts the RGB values in 8 bits (0 - 255) and then combines them into
	# one long stringto make them more manageable
	var colour = str(RGB.r8, RGB.g8, RGB.b8)

# Debug code to see if it's outputing the correct values 
	#$Label.text = (colour)

# Looks for a certain colour and then changes properties accordingly 

	# Obsidian
	if background > 11 && background < 15:
		if colour == "313050" or colour == "254254254" or colour == "001":
			friction = -2
		else:
			friction = -20

	# Snowy Road
	if background > 15 && background < 19:
		if colour == "225242255" or colour == "255255255" or colour == "001":
			friction = -2
		else:
			friction = -5

	# Road (Grass)
	if colour == "132132132":
		friction = -2

	# Sandstone
	elif colour == "255239115":
		friction = -2
		friction = -2

	# Grass
	elif colour == "2620176":
		friction = -5

	# Sand
	elif colour == "255255156":
		friction = -5

	# Wall
	elif colour == "999999":
		friction = -20

	# Menu Background
	elif colour == "256256256":
		friction = -2

func apply_friction():
	if velocity.length() < 5:
		velocity = Vector2.ZERO
	var friction_force = velocity * friction
	var drag_force = velocity * velocity.length() * drag
	acceleration += drag_force + friction_force

func get_input():
	var turn = 0
	if Input.is_action_pressed("Right2"):
		turn += 1
	if Input.is_action_pressed("Left2"):
		turn -= 1
	steer_direction = turn * deg2rad(steering_angle)
	if Input.is_action_pressed("Acceleration2"):
		acceleration = transform.x * engine_power
	if Input.is_action_pressed("Brake2"):
		acceleration = transform.x * braking

func calculate_steering(delta):
	var rear_wheel = position - transform.x * wheel_base/2.0
	var front_wheel = position + transform.x * wheel_base/2.0
	rear_wheel += velocity * delta
	front_wheel += velocity.rotated(steer_direction) * delta
	var new_heading = (front_wheel - rear_wheel).normalized()
	var traction = traction_slow
	if velocity.length() > slip_speed:
		traction = traction_fast
	var d = new_heading.dot(velocity.normalized())
	if d > 0:
		velocity = velocity.linear_interpolate(new_heading * velocity.length(), traction)
	if d < 0:
		velocity = -new_heading * min(velocity.length(), max_speed_reverse)
	rotation = new_heading.angle()

func Background_Settings():

	if background == 1:

		position.x = 512
		position.y = 310
		rotation_degrees = 0

	if background == 2:

		position.x = 512
		position.y = 310
		rotation_degrees = 180

	if background == 3:

		position.x = 100
		position.y = 310
		rotation_degrees = 0

	if background == 4:

		position.x = 445
		position.y = 89
		rotation_degrees = 0

	if background == 5:

		position.x = 664
		position.y = 570
		rotation_degrees = 0

	if background == 6:

		position.x = 506
		position.y = 358
		rotation_degrees = 0

	if background == 7:

		position.x = 582
		position.y = 526
		rotation_degrees = 58

	if background == 8:

		position.x = 472
		position.y = 537
		rotation_degrees = 0

	if background == 9:

		position.x = 378
		position.y = 83
		rotation_degrees = 0

	if background == 10:

		position.x = 527
		position.y = 64
		rotation_degrees = 0
		
	if background == 11:

		position.x = 422
		position.y = 95
		rotation_degrees = 0

	if background == 12:

		position.x = 582
		position.y = 538
		rotation_degrees = 0

	if background == 13:

		position.x = 558
		position.y = 520
		rotation_degrees = 0

	if background == 14:

		position.x = 488
		position.y = 200
		rotation_degrees = 0

	if background == 15:

		position.x = 568
		position.y = 110
		rotation_degrees = 0

	if background == 16:

		position.x = 847
		position.y = 200
		rotation_degrees = 270

	if background == 17:

		position.x = 440
		position.y = 534
		rotation_degrees = 0

	if background == 18:

		position.x = 427
		position.y = 84
		rotation_degrees = 0

	if background == 19:

		position.x = 696
		position.y = 428
		rotation_degrees = 0

func _on_SlipStreamS1_area_entered(area):
	if area.name == "CarBody2":
		print("1 has entered 2")
		MulitSpeed = 1

func _on_SlipStreamS1_area_exited(area):
	if area.name == "CarBody2":
		print("1 has left 2")
		MulitSpeed = 1.25
