extends CanvasLayer
var X1
var Y1
var X2
var Y2

var Lap_Segment1 = 1
var Lap_Segment2 = 1

var Lap_Amount = 2

var lap1 = 1
var lap2 = 1
var wins1 = 0
var wins2 = 0

var time = 0

func _process(_delta):
# Timer For Players
	if $Player1.background >= 4:
		if !(wins1 + 1) == Lap_Amount:
			$Player1_Time.text = ("Player 1 " + str(time))

		if !(wins2 + 1) == Lap_Amount:
			$Player2_Time.text = ("Player 2 " + str(time))

		if $Timer.time_left <= 0.1:
			$Timer.start()
			time = (0.05 + time)

# Background Changer + Track Changer
	if $Player1.Background_OLD == 0:
			$Track.texture = load("res://Assets/Tracks/Start.png")

	elif $Player1.Background_OLD == 1:
			$Track.texture = load("res://Assets/Tracks/Menu.png")
			get_node("Track/Arrow1").show()
			get_node("Track/Arrow2").hide()

			for index in 8:
				get_node("Track/Track" + str(index + 1)).texture = load("res://Assets/Tracks/Track" + str(index + 1) + ".png")
			Show_Tracks()

	elif $Player1.Background_OLD == 2:
			$Track.texture = load("res://Assets/Tracks/Menu.png")
			get_node("Track/Arrow1").hide()
			get_node("Track/Arrow2").show()

			for index in 8:
				get_node("Track/Track" + str(index + 1)).texture = load("res://Assets/Tracks/Track" + str(index + 9) + ".png")
			Show_Tracks()

	elif $Player1.Background_OLD == 3:
			$Track.texture = load("res://Assets/Tracks/Menu.png")

	elif $Player1.Background_OLD >= 4:
			$Track.texture = load("res://Assets/Tracks/Track" + str($Player1.Background_OLD - 3) + ".png")
			Hide_Tracks()

# Lap Completion

	X1 = $Player1.position.x
	Y1 = $Player1.position.y
	X2 = $Player2.position.x
	Y2 = $Player2.position.y

	# Track 1
	if $Player1.Background_OLD == 4:
		if Lap_Segment1 == 1 && X1 >= 700 && Y1 >= 300:
			Lap_Segment1 = 2

		if Lap_Segment2 == 1 && X2 >= 700 && Y2 >= 300:
			Lap_Segment2 = 2


		if Lap_Segment1 == 2 && X1 >= 512 && Y1 >= 450:
			Lap_Segment1 = 3

		if Lap_Segment2 == 2 && X2 >= 512 && Y2 >= 450:
			Lap_Segment2 = 3


		if Lap_Segment1 == 3 && X1 <= 300 && Y1 <= 300 :
			Lap_Segment1 = 4

		if Lap_Segment2 == 3 && X2 <= 300 && Y2 <= 300 :
			Lap_Segment2 = 4


		if Lap_Segment1 == 4 && X1 >= 460 && Y1 <= 120 :
			Lap_Segment1 = 1
			lap1 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap1 == Lap_Amount:
				wins1 += 1

		if Lap_Segment2 == 4 && X2 >= 460 && Y2 <= 120:
			Lap_Segment2 = 1
			lap2 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap2 == Lap_Amount:
				wins2 += 1

	# Track 2
	if $Player1.Background_OLD == 5:
		if Lap_Segment1 == 1 && X1 >= 800 && Y1 <= 300:
			Lap_Segment1 = 2

		if Lap_Segment2 == 1 && X2 >= 800 && Y2 <= 300:
			Lap_Segment2 = 2


		if Lap_Segment1 == 2 && X1 <= 512 && Y1 <= 150:
			Lap_Segment1 = 3

		if Lap_Segment2 == 2 && X2 >= 512 && Y2 <= 150:
			Lap_Segment2 = 3


		if Lap_Segment1 == 3 && X1 <= 250 && Y1 >= 300 :
			Lap_Segment1 = 4

		if Lap_Segment2 == 3 && X2 <= 250 && Y2 >= 300 :
			Lap_Segment2 = 4


		if Lap_Segment1 == 4 && X1 >= 750 && Y1 >= 510:
			Lap_Segment1 = 1
			lap1 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap1 == Lap_Amount:
				wins1 += 1

		if Lap_Segment2 == 4 && X2 >= 750 && Y2 >= 510:
			Lap_Segment2 = 1
			lap2 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap2 == Lap_Amount:
				wins2 += 1

	# Track 3
	if $Player1.Background_OLD == 6:
		if Lap_Segment1 == 1 && X1 <= 230 && Y1 <= 130:
			Lap_Segment1 = 2

		if Lap_Segment2 == 1 && X2 <= 230 && Y2 <= 130:
			Lap_Segment2 = 2


		if Lap_Segment1 == 2 && X1 >= 830 && Y1 >= 300:
			Lap_Segment1 = 3

		if Lap_Segment2 == 2 && X2 >= 830 && Y2 >= 300:
			Lap_Segment2 = 3


		if Lap_Segment1 == 3 && X1 <= 450 && Y1 >= 470:
			Lap_Segment1 = 4

		if Lap_Segment2 == 3 && X2 <= 450 && Y2 >= 470:
			Lap_Segment2 = 4


		if Lap_Segment1 == 4 && X1 >= 600 && Y1 <= 420:
			Lap_Segment1 = 1
			lap1 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap1 == Lap_Amount:
				wins1 += 1

		if Lap_Segment2 == 4 && X2 >= 600 && Y2 <= 420:
			Lap_Segment2 = 1
			lap2 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap2 == Lap_Amount:
				wins2 += 1

	# Track 4
	if $Player1.Background_OLD == 7:
		if Lap_Segment1 == 1 && X1 >= 700 && Y1 <= 300:
			Lap_Segment1 = 2

		if Lap_Segment2 == 1 && X2 >= 700 && Y2 <= 300:
			Lap_Segment2 = 2


		if Lap_Segment1 == 2 && X1 <= 512 && Y1 <= 100:
			Lap_Segment1 = 3

		if Lap_Segment2 == 2 && X2 <= 512 && Y2 <= 100:
			Lap_Segment2 = 3


		if Lap_Segment1 == 3 && X1 >= 490 && Y1 >= 225 :
			Lap_Segment1 = 4

		if Lap_Segment2 == 3 && X2 >= 490 && Y2 >= 255 :
			Lap_Segment2 = 4


		if Lap_Segment1 == 4 && X1 >= 690 && Y1 <= 480 :
			Lap_Segment1 = 1
			lap1 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap1 == Lap_Amount:
				wins1 += 1

		if Lap_Segment2 == 4 && X2 >= 690 && Y2 <= 480:
			Lap_Segment2 = 1
			lap2 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap2 == Lap_Amount:
				wins2 += 1

	# Track 5
	if $Player1.Background_OLD == 8:
		if Lap_Segment1 == 1 && X1 >= 810 && Y1 <= 300:
			Lap_Segment1 = 2

		if Lap_Segment2 == 1 && X2 >= 810 && Y2 <= 300:
			Lap_Segment2 = 2


		if Lap_Segment1 == 2 && X1 <= 512 && Y1 <= 120:
			Lap_Segment1 = 3

		if Lap_Segment2 == 2 && X2 <= 512 && Y2 <= 120:
			Lap_Segment2 = 3


		if Lap_Segment1 == 3 && X1 <= 200 && Y1 >= 300:
			Lap_Segment1 = 4

		if Lap_Segment2 == 3 && X2 <= 200 && Y2 >= 300:
			Lap_Segment2 = 4


		if Lap_Segment1 == 4 && X1 >= 550 && Y1 <= 450:
			Lap_Segment1 = 1
			lap1 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap1 == Lap_Amount:
				wins1 += 1

		if Lap_Segment2 == 4 && X2 >= 550 && Y2 <= 450:
			Lap_Segment2 = 1
			lap2 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap2 == Lap_Amount:
				wins2 += 1

	#Track 6
	if $Player1.Background_OLD == 9:
		if Lap_Segment1 == 1 && X1 >= 800 && Y1 <= 300:
			Lap_Segment1 = 2

		if Lap_Segment2 == 1 && X2 >= 800 && Y2 <= 300:
			Lap_Segment2 = 2


		if Lap_Segment1 == 2 && X1 <= 512 && Y1 >= 400:
			Lap_Segment1 = 3

		if Lap_Segment2 == 2 && X2 <= 512 && Y2 >= 400:
			Lap_Segment2 = 3


		if Lap_Segment1 == 3 && X1 <= 220 && Y1 <= 300:
			Lap_Segment1 = 4

		if Lap_Segment2 == 3 && X2 <= 220 && Y2 <= 300:
			Lap_Segment2 = 4


		if Lap_Segment1 == 4 && X1 >= 450 && Y1 <= 100:
			Lap_Segment1 = 1
			lap1 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap1 == Lap_Amount:
				wins1 += 1

		if Lap_Segment2 == 4 && X2 >= 450 && Y2 <= 100:
			Lap_Segment2 = 1
			lap2 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap2 == Lap_Amount:
				wins2 += 1

	#Track 7
	if $Player1.Background_OLD == 10:
		if Lap_Segment1 == 1 && X1 >= 800 && Y1 >= 300:
			Lap_Segment1 = 2

		if Lap_Segment2 == 1 && X2 >= 800 && Y2 >= 300:
			Lap_Segment2 = 2


		if Lap_Segment1 == 2 && X1 <= 440 && Y1 >= 215:
			Lap_Segment1 = 3

		if Lap_Segment2 == 2 && X2 <= 440 && Y2 >= 215:
			Lap_Segment2 = 3


		if Lap_Segment1 == 3 && X1 <= 250 && Y1 <= 300:
			Lap_Segment1 = 4

		if Lap_Segment2 == 3 && X2 <= 250 && Y2 <= 300:
			Lap_Segment2 = 4


		if Lap_Segment1 == 4 && X1 >= 590 && Y1 <= 100:
			Lap_Segment1 = 1
			lap1 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap1 == Lap_Amount:
				wins1 += 1

		if Lap_Segment2 == 4 && X2 >= 590 && Y2 <= 100:
			Lap_Segment2 = 1
			lap2 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap2 == Lap_Amount:
				wins2 += 1

	#Track 8
	if $Player1.Background_OLD == 11:
		if Lap_Segment1 == 1 && X1 >= 740 && Y1 >= 300:
			Lap_Segment1 = 2

		if Lap_Segment2 == 1 && X2 >= 740 && Y2 >= 300:
			Lap_Segment2 = 2


		if Lap_Segment1 == 2 && X1 <= 512 && Y1 >= 400:
			Lap_Segment1 = 3

		if Lap_Segment2 == 2 && X2 <= 512 && Y2 >= 400:
			Lap_Segment2 = 3


		if Lap_Segment1 == 3 && X1 <= 200 && Y1 <= 300:
			Lap_Segment1 = 4

		if Lap_Segment2 == 3 && X2 <= 200 && Y2 <= 300:
			Lap_Segment2 = 4


		if Lap_Segment1 == 4 && X1 >= 490 && Y1 <= 100:
			Lap_Segment1 = 1
			lap1 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap1 == Lap_Amount:
				wins1 += 1

		if Lap_Segment2 == 4 && X2 >= 490 && Y2 <= 100:
			Lap_Segment2 = 1
			lap2 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap2 == Lap_Amount:
				wins2 += 1

	#Track 9
	if $Player1.Background_OLD == 12:
		if Lap_Segment1 == 1 && X1 >= 750 && Y1 <= 300:
			Lap_Segment1 = 2

		if Lap_Segment2 == 1 && X2 >= 750 && Y2 <= 300:
			Lap_Segment2 = 2


		if Lap_Segment1 == 2 && X1 <= 512 && Y1 <= 130:
			Lap_Segment1 = 3

		if Lap_Segment2 == 2 && X2 <= 512 && Y2 <= 130:
			Lap_Segment2 = 3


		if Lap_Segment1 == 3 && X1 <= 230 && Y1 <= 300:
			Lap_Segment1 = 4

		if Lap_Segment2 == 3 && X2 <= 230 && Y2 <= 300:
			Lap_Segment2 = 4


		if Lap_Segment1 == 4 && X1 >= 600 && Y1 >= 450:
			Lap_Segment1 = 1
			lap1 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap1 == Lap_Amount:
				wins1 += 1

		if Lap_Segment2 == 4 && X2 >= 600 && Y2 >= 450:
			Lap_Segment2 = 1
			lap2 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap2 == Lap_Amount:
				wins2 += 1

	#Track 10
	if $Player1.Background_OLD == 13:
		if Lap_Segment1 == 1 && X1 >= 730 && Y1 <= 300:
			Lap_Segment1 = 2

		if Lap_Segment2 == 1 && X2 >= 730 && Y2 <= 300:
			Lap_Segment2 = 2


		if Lap_Segment1 == 2 && X1 <= 512 && Y1 <= 150:
			Lap_Segment1 = 3

		if Lap_Segment2 == 2 && X2 <= 512 && Y2 <= 150:
			Lap_Segment2 = 3


		if Lap_Segment1 == 3 && X1 <= 270 && Y1 >= 300:
			Lap_Segment1 = 4

		if Lap_Segment2 == 3 && X2 <= 270 && Y2 >= 300:
			Lap_Segment2 = 4


		if Lap_Segment1 == 4 && X1 >= 570 && Y1 >= 500:
			Lap_Segment1 = 1
			lap1 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap1 == Lap_Amount:
				wins1 += 1

		if Lap_Segment2 == 4 && X2 >= 570 && Y2 >= 500:
			Lap_Segment2 = 1
			lap2 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap2 == Lap_Amount:
				wins2 += 1

	#Track 11
	if $Player1.Background_OLD == 14:
		if Lap_Segment1 == 1 && X1 >= 800 && Y1 >= 300:
			Lap_Segment1 = 2

		if Lap_Segment2 == 1 && X2 >= 800 && Y2 >= 300:
			Lap_Segment2 = 2


		if Lap_Segment1 == 2 && X1 <= 512 && Y1 >= 490:
			Lap_Segment1 = 3

		if Lap_Segment2 == 2 && X2 <= 512 && Y2 >= 490:
			Lap_Segment2 = 3


		if Lap_Segment1 == 3 && X1 <= 230 && Y1 <= 300:
			Lap_Segment1 = 4

		if Lap_Segment2 == 3 && X2 <= 230 && Y2 <= 300:
			Lap_Segment2 = 4


		if Lap_Segment1 == 4 && X1 >= 540 && Y1 <= 240:
			Lap_Segment1 = 1
			lap1 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap1 == Lap_Amount:
				wins1 += 1

		if Lap_Segment2 == 4 && X2 >= 540 && Y2 <= 240:
			Lap_Segment2 = 1
			lap2 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap2 == Lap_Amount:
				wins2 += 1

	#Track 12
	if $Player1.Background_OLD == 15:
		if Lap_Segment1 == 1 && X1 >= 780 && Y1 >= 300:
			Lap_Segment1 = 2

		if Lap_Segment2 == 1 && X2 >= 780 && Y2 >= 300:
			Lap_Segment2 = 2


		if Lap_Segment1 == 2 && X1 <= 512 && Y1 >= 270:
			Lap_Segment1 = 3

		if Lap_Segment2 == 2 && X2 <= 512 && Y2 >= 270:
			Lap_Segment2 = 3


		if Lap_Segment1 == 3 && X1 <= 250 && Y1 <= 300:
			Lap_Segment1 = 4

		if Lap_Segment2 == 3 && X2 <= 250 && Y2 <= 300:
			Lap_Segment2 = 4


		if Lap_Segment1 == 4 && X1 >= 610 && Y1 <= 100:
			Lap_Segment1 = 1
			lap1 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap1 == Lap_Amount:
				wins1 += 1

		if Lap_Segment2 == 4 && X2 >= 610 && Y2 <= 100:
			Lap_Segment2 = 1
			lap2 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap2 == Lap_Amount:
				wins2 += 1

	#Track 13
	if $Player1.Background_OLD == 16:
		if Lap_Segment1 == 1 && X1 <= 512 && Y1 <= 120:
			Lap_Segment1 = 2

		if Lap_Segment2 == 1 && X2 <= 512 && Y2 <= 120:
			Lap_Segment2 = 2


		if Lap_Segment1 == 2 && X1 <= 250 && Y1 >= 300:
			Lap_Segment1 = 3

		if Lap_Segment2 == 2 && X2 <= 250 && Y2 >= 300:
			Lap_Segment2 = 3


		if Lap_Segment1 == 3 && X1 >= 512 && Y1 <= 470:
			Lap_Segment1 = 4

		if Lap_Segment2 == 3 && X2 >= 512 && Y2 <= 470:
			Lap_Segment2 = 4


		if Lap_Segment1 == 4 && X1 >= 800 && Y1 <= 340:
			Lap_Segment1 = 1
			lap1 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap1 == Lap_Amount:
				wins1 += 1

		if Lap_Segment2 == 4 && X2 >= 800 && Y2 <= 340:
			Lap_Segment2 = 1
			lap2 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap2 == Lap_Amount:
				wins2 += 1

	#Track 14
	if $Player1.Background_OLD == 17:
		if Lap_Segment1 == 1 && X1 >= 770 && Y1 >= 300:
			Lap_Segment1 = 2

		if Lap_Segment2 == 1 && X2 >= 770 && Y2 >= 300:
			Lap_Segment2 = 2


		if Lap_Segment1 == 2 && X1 <= 512 && Y1 <= 170:
			Lap_Segment1 = 3

		if Lap_Segment2 == 2 && X2 <= 512 && Y2 <= 170:
			Lap_Segment2 = 3


		if Lap_Segment1 == 3 && X1 <= 340 && Y1 >= 300:
			Lap_Segment1 = 4

		if Lap_Segment2 == 3 && X2 <= 340 && Y2 >= 300:
			Lap_Segment2 = 4


		if Lap_Segment1 == 4 && X1 >= 530 && Y1 <= 500:
			Lap_Segment1 = 1
			lap1 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap1 == Lap_Amount:
				wins1 += 1

		if Lap_Segment2 == 4 && X2 >= 530 && Y2 <= 500:
			Lap_Segment2 = 1
			lap2 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap2 == Lap_Amount:
				wins2 += 1

	#Track 15
	if $Player1.Background_OLD == 18:
		if Lap_Segment1 == 1 && X1 >= 700 && Y1 >= 300:
			Lap_Segment1 = 2

		if Lap_Segment2 == 1 && X2 >= 700 && Y2 >= 300:
			Lap_Segment2 = 2


		if Lap_Segment1 == 2 && X1 <= 512 && Y1 >= 480:
			Lap_Segment1 = 3

		if Lap_Segment2 == 2 && X2 <= 512 && Y2 >= 480:
			Lap_Segment2 = 3


		if Lap_Segment1 == 3 && X1 <= 310 && Y1 <= 300:
			Lap_Segment1 = 4

		if Lap_Segment2 == 3 && X2 <= 310 && Y2 <= 300:
			Lap_Segment2 = 4


		if Lap_Segment1 == 4 && X1 >= 490 && Y1 <= 100:
			Lap_Segment1 = 1
			lap1 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap1 == Lap_Amount:
				wins1 += 1

		if Lap_Segment2 == 4 && X2 >= 490 && Y2 <= 100:
			Lap_Segment2 = 1
			lap2 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap2 == Lap_Amount:
				wins2 += 1

	#Track 16
		if Lap_Segment1 == 1 && X1 >= 750 && Y1 >= 300:
			Lap_Segment1 = 2

		if Lap_Segment2 == 1 && X2 >= 750 && Y2 >= 300:
			Lap_Segment2 = 2


		if Lap_Segment1 == 2 && X1 <= 420 && Y1 <= 130:
			Lap_Segment1 = 3

		if Lap_Segment2 == 2 && X2 <= 420 && Y2 <= 130:
			Lap_Segment2 = 3


		if Lap_Segment1 == 3 && X1 <= 450 && Y1 <= 440:
			Lap_Segment1 = 4

		if Lap_Segment2 == 3 && X2 <= 450 && Y2 <= 440:
			Lap_Segment2 = 4


		if Lap_Segment1 == 4 && X1 >= 720 && Y1 <= 370:
			Lap_Segment1 = 1
			lap1 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap1 == Lap_Amount:
				wins1 += 1

		if Lap_Segment2 == 4 && X2 >= 720 && Y2 <= 370:
			Lap_Segment2 = 1
			lap2 += 1
			if lap1 == Lap_Amount && lap2 == Lap_Amount:
				$Player1.background = 1
			elif lap2 == Lap_Amount:
				wins2 += 1

func Show_Tracks():
	for index in 8:
		get_node("Track/Track" + str(index + 1)).show()

	$Player1_Time.hide()
	$Player2_Time.hide()
	$Timer.start()

func Hide_Tracks():
	for index in 8:
		get_node("Track/Track" + str(index + 1)).hide()
	get_node("Track/Arrow1").hide()
	get_node("Track/Arrow2").hide()

	$Player1_Time.show()
	$Player2_Time.show()
