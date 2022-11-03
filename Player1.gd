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

func _on_Area2D_area_entered(area):

	if area.name == "ArrowAreaRight":
		if background == 1:
			position.x = 512
			position.y = 290
			rotation_degrees = 180
			background = 2

	elif area.name == "ArrowAreaLeft":
		if background == 2:
			position.x = 512
			position.y = 290
			rotation_degrees = 0
			background = 1

	elif background == 2:
		background = int(area.name[9]) + 11
		$Area2D.hide()

	elif background == 1:
		background = int(area.name[9]) + 3
		$Area2D.hide()

func _physics_process(delta):

	acceleration = Vector2.ZERO
	get_input()
	apply_friction()
	calculate_steering(delta)
	set_speed()
	velocity += acceleration * delta
	velocity = move_and_slide(velocity)

	if !background == Background_OLD:
		Background_OLD = background
		Background_Settings()

# Stops the player from going out of bounds and crashing the game
	var screen_size = get_viewport_rect().size
	position.y = clamp(position.y, 0, screen_size.y)
	position.x = clamp(position.x, 0, screen_size.x)

	#$Label.text = ("X:" + str(int(position.x)) + " Y:" + str(int(position.y)))

func set_speed():

# Gets the texture from the background sprite then assigns it variable "background"

	var Texture = get_node("/root/Node2D/Background/Track").get_texture()
	var data = Texture.get_data()

# Gets the RGBA (Red, Green, Blue, Alpha (Opacity)) from data
	data.lock()
	var RGB = data.get_pixel(position.x,position.y)
	data.unlock()

# Converts the RGB values into 8 bits (0 - 255) and then combines them into
	# one long string to make them more manageable
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

	# Road (Grasslands)
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

	# Menu Opener
	elif colour == "015351":
		background = 1
		position.x = 512
		position.y = 290
		rotation_degrees = 0

	# Options Opener
	elif colour == "25500":
		background = 3
		position.x = 100
		position.y = 290
		rotation_degrees = 0

func apply_friction():
	if velocity.length() < 5:
		velocity = Vector2.ZERO
	var friction_force = velocity * friction
	var drag_force = velocity * velocity.length() * drag
	acceleration += drag_force + friction_force

func get_input():
	var turn = 0
	if Input.is_action_pressed("Right1"):
		turn += 1
	if Input.is_action_pressed("Left1"):
		turn -= 1
	steer_direction = turn * deg2rad(steering_angle)
	if Input.is_action_pressed("Acceleration1"):
		acceleration = transform.x * engine_power
	if Input.is_action_pressed("Brake1"):
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
		position.y = 290
		rotation_degrees = 0

	if background == 4:

		position.x = 400
		position.y = 45
		rotation_degrees = 0

	if background == 5:

		position.x = 718
		position.y = 537
		rotation_degrees = 0

	if background == 6:

		position.x = 566
		position.y = 397
		rotation_degrees = 0

	if background == 7:

		position.x = 600
		position.y = 464
		rotation_degrees = 58

	if background == 8:

		position.x = 510
		position.y = 486
		rotation_degrees = 0

	if background == 9:

		position.x = 418
		position.y = 32
		rotation_degrees = 0

	if background == 10:

		position.x = 554
		position.y = 21
		rotation_degrees = 0

	if background == 11:

		position.x = 454
		position.y = 42
		rotation_degrees = 0

	if background == 12:

		position.x = 546
		position.y = 494
		rotation_degrees = 0

	if background == 13:

		position.x = 528
		position.y = 554
		rotation_degrees = 0

	if background == 14:

		position.x = 522
		position.y = 158
		rotation_degrees = 0

	if background == 15:

		position.x = 595
		position.y = 75
		rotation_degrees = 0

	if background == 16:

		position.x = 816
		position.y = 255
		rotation_degrees = 270

	if background == 17:

		position.x = 490
		position.y = 566
		rotation_degrees = 0

	if background == 18:

		position.x = 476
		position.y = 48
		rotation_degrees = 0

	if background == 19:

		position.x = 640
		position.y = 396
		rotation_degrees = 0


func _on_SlipStreamS2_area_entered(area):
	if area.name == "CarBody1":
		print("2 has entered 1")
		MulitSpeed = 1

func _on_SlipStreamS2_area_exited(area):
	if area.name == "CarBody1":
		print("2 has left 1")
		friction = friction * .75
