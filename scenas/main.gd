extends Node2D
@onready var musica_juego = $Musica_Juego
@onready var music_menu =$Music_Menu

# Called when the node enters the scene tree for the first time.
func _ready():
	musica_juego.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_music_menu_finished() -> void:
	musica_juego.play()
