extends Node2D

@export var lights : Array[PointLight2D]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body:CharacterBody2D):
	if body is player or body is player2:
		body.connect("interactuar", self.accion)

func accion():
	for light in lights:
		light.enabled = !light.enabled