extends Node2D

@onready var viewport1 := $HBoxContainer/SubViewportContainer/SubViewport
@onready var viewport2 := $HBoxContainer/SubViewportContainer2/SubViewport
@onready var camera1 := $Node/HBoxContainer/SubViewportContainer/SubViewport/CharacterBody2D/Camera2D2
@onready var camera2 := $Node/HBoxContainer/SubViewportContainer2/SubViewport/player2/Camera2D_1
@onready var world := $"."

func ready():
	viewport2.world_2d = viewport1.world_2d
	camera1.target = world.get_node("$Node/HBoxContainer/SubViewportContainer/SubViewport/CharacterBody2D")
	camera2.target = world.get_node("Node/HBoxContainer/SubViewportContainer2/SubViewport/player2")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
