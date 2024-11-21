extends Control
@onready var game_window = get_node("GameWindow")
@onready var game_control = get_node("GameWindow/Control")
@onready var animation_player = get_node("GameWindow/AnimationPlayer")
@onready var audio_stream_player = get_node("AudioStreamPlayer")

@export var sound_strike: AudioStream
@export var sound_correct: AudioStream

var team_points = [0,0,0]
var active_team = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignals.emit_signal("loadSet", 1)
	GlobalSignals.connect("addPoints", _on_points_added)
	#game_window = get_node("Window")
#	game_window.content_scale_mode = Window.CONTENT_SCALE_MODE_VIEWPORT
#	game_window.content_scale_aspect = Window.CONTENT_SCALE_ASPECT_IGNORE
	#game_window.mode = Window.MODE_FULLSCREEN
	pass
	#game_window.content_scale_size = Vector2i(1,1)
	
	

func _on_points_added(points):
	print(points)
	#team_points[active_team] += points
	if(active_team != 2):
		game_control.get_node("GameBase").get_node("TemporaryScoreLabel").text = str(int(game_control.get_node("GameBase").get_node("TemporaryScoreLabel").text) + points)
	print(team_points)
	get_node("BoxContainer/HBoxContainer5/CurrentPointsLabel").text = str(team_points)
	get_node("GameWindow/Control/GameBase/SkorGuru").text = str(team_points[0])
	get_node("GameWindow/Control/GameBase/SkorMurid").text = str(team_points[1])
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_show_wallpaper_pressed():
	animation_player.play_backwards("WallpaperToGameBase")
	#game_control.get_node("Wallpaper").visible = true

func _on_button_show_game_background_pressed():
	animation_player.play("WallpaperToGameBase")
	#game_control.get_node("Wallpaper").visible = false


func _on_button_reveal_1_pressed():
	GlobalSignals.emit_signal("revealPressed", 1)
	audio_stream_player.stream = sound_correct
	audio_stream_player.play()
	pass # Replace with function body.


func _on_button_reveal_2_pressed():
	GlobalSignals.emit_signal("revealPressed", 2)
	audio_stream_player.stream = sound_correct
	audio_stream_player.play()
	pass # Replace with function body.


func _on_button_reveal_3_pressed():
	GlobalSignals.emit_signal("revealPressed", 3)
	audio_stream_player.stream = sound_correct
	audio_stream_player.play()
	pass # Replace with function body.


func _on_button_reveal_4_pressed():
	GlobalSignals.emit_signal("revealPressed", 4)
	audio_stream_player.stream = sound_correct
	audio_stream_player.play()
	pass # Replace with function body.


func _on_button_reveal_5_pressed():
	GlobalSignals.emit_signal("revealPressed", 5)
	audio_stream_player.stream = sound_correct
	audio_stream_player.play()
	pass # Replace with function body.


func _on_button_reveal_6_pressed():
	GlobalSignals.emit_signal("revealPressed", 6)
	audio_stream_player.stream = sound_correct
	audio_stream_player.play()
	pass # Replace with function body.


func _on_button_reveal_7_pressed():
	GlobalSignals.emit_signal("revealPressed", 7)
	audio_stream_player.stream = sound_correct
	audio_stream_player.play()
	pass # Replace with function body.


func _on_button_reveal_8_pressed():
	GlobalSignals.emit_signal("revealPressed", 8)
	audio_stream_player.stream = sound_correct
	audio_stream_player.play()
	pass # Replace with function body.


func _on_button_reset_answer_panels_pressed():
	GlobalSignals.emit_signal("revealPressed", 0)
	game_control.get_node("GameBase").get_node("TemporaryScoreLabel").text = "0"
	
	pass # Replace with function body.




var questions = [
"Apa kegiatan yang sering dilakukan siswa/siswi sepulang sekolah",
"Apa saat-saat yang paling ditunggu siswa SMAK 1",
"Apa jajanan sekitar sekolah yang paling digemari siswa SMAK 1",
"",
"",
]







func _on_set_1_pressed():
	GlobalSignals.emit_signal("loadSet", 1)
	get_node("GameWindow/Control/GameBase/Question/QuestionLabel").text = questions[0]
	pass # Replace with function body.


func _on_set_2_pressed():
	GlobalSignals.emit_signal("loadSet", 2)
	get_node("GameWindow/Control/GameBase/Question/QuestionLabel").text = questions[1]
	pass # Replace with function body.


func _on_set_3_pressed():
	GlobalSignals.emit_signal("loadSet", 3)
	get_node("GameWindow/Control/GameBase/Question/QuestionLabel").text = questions[2]
	pass # Replace with function body.


func _on_set_4_pressed():
	GlobalSignals.emit_signal("loadSet", 4)
	get_node("GameWindow/Control/GameBase/Question/QuestionLabel").text = questions[3]
	pass # Replace with function body.


func _on_set_5_pressed():
	GlobalSignals.emit_signal("loadSet", 5)
	get_node("GameWindow/Control/GameBase/Question/QuestionLabel").text = questions[4]
	pass # Replace with function body.


func _on_button_incorrect_pressed():
	animation_player.play("Strike")
	audio_stream_player.stream = sound_strike
	audio_stream_player.play()
	pass # Replace with function body.


func _on_activate_team_a_pressed():
	active_team = 0
	get_node("BoxContainer/HBoxContainer5/ActiveTeamLabel").text = "Active Team: A (Guru)"
	pass # Replace with function body.


func _on_activate_team_b_pressed():
	active_team = 1
	get_node("BoxContainer/HBoxContainer5/ActiveTeamLabel").text = "Active Team: B (Murid)"
	pass # Replace with function body.


func _on_swap_team_points_pressed():
	if active_team == 1:
		_on_activate_team_a_pressed()
	else:
		_on_activate_team_b_pressed()

	var old_team_A_points = team_points[0]
	var old_team_B_points = team_points[1]
	team_points[1] = old_team_A_points
	team_points[0] = old_team_B_points
	print(team_points)
	
	#game_control.get_node("GameBase").get_node("TemporaryScoreLabel").text = "0"
	get_node("BoxContainer/HBoxContainer5/CurrentPointsLabel").text = str(team_points)
	get_node("GameWindow/Control/GameBase/SkorGuru").text = str(team_points[0])
	get_node("GameWindow/Control/GameBase/SkorMurid").text = str(team_points[1])


func _on_button_show_game_pressed():
	animation_player.play_backwards("GameBaseToScoreboard")
	pass # Replace with function body.


func _on_button_show_scoreboard_pressed():
	animation_player.play("GameBaseToScoreboard")
	pass # Replace with function body.


func _on_disable_point_collection_pressed():
	active_team = 2
	get_node("BoxContainer/HBoxContainer5/ActiveTeamLabel").text = "Point Collection Disabled"
		
	pass # Replace with function body.


func _on_team_a_override_button_pressed():
	team_points[0] = int(get_node("BoxContainer/HBoxContainer7/APointsOverrideTextBox").text)
	get_node("BoxContainer/HBoxContainer5/CurrentPointsLabel").text = str(team_points)
	get_node("GameWindow/Control/GameBase/SkorGuru").text = str(team_points[0])
	get_node("GameWindow/Control/GameBase/SkorMurid").text = str(team_points[1])
	pass # Replace with function body.


func _on_team_b_override_button_pressed():
	team_points[1] = int(get_node("BoxContainer/HBoxContainer7/BPointsOverrideTextBox").text)
	get_node("BoxContainer/HBoxContainer5/CurrentPointsLabel").text = str(team_points)
	get_node("GameWindow/Control/GameBase/SkorGuru").text = str(team_points[0])
	get_node("GameWindow/Control/GameBase/SkorMurid").text = str(team_points[1])
	pass # Replace with function body.


func _on_show_pertanyaan_button_pressed():
	animation_player.play("FadeInQuestion")
	pass # Replace with function body.


func _on_hide_pertanyaan_button_pressed():
	animation_player.play_backwards("FadeInQuestion")
	pass # Replace with function body.


func _on_add_points_pressed():
	team_points[active_team] += int(game_control.get_node("GameBase").get_node("TemporaryScoreLabel").text)
	get_node("BoxContainer/HBoxContainer5/CurrentPointsLabel").text = str(team_points)
	get_node("GameWindow/Control/GameBase/SkorGuru").text = str(team_points[0])
	get_node("GameWindow/Control/GameBase/SkorMurid").text = str(team_points[1])
	pass # Replace with function body.
