extends Node2D
@onready var musica_juego = $Musica_Juego
@onready var music_menu =$Music_Menu

# Called when the node enters the scene tree for the first time.
func _ready():
	#musica_juego.play()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event):
	if event.is_action_pressed("ui_select"):
		print("L")
		musica_juego.stop()
		music_menu.stop()
		
func _input1(event):
	if event.is_action_pressed("ui_accept"):
		print("A")
		musica_juego.play()
		music_menu.play()


func _on_musica_juego_finished() -> void:
	musica_juego.play()
