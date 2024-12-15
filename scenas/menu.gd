extends Node2D

# Carga la escena a la que deseas cambiar
var next_scene = "res://scenas/main.tscn"

# Función llamada cuando se presiona el botón
func _on_Button_pressed():
	# Cambia a la nueva escena
	get_tree().change_scene_to_file(next_scene)
