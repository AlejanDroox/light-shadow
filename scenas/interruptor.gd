extends Node2D

@export var lights : Array[PointLight2D]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_area_2d_body_entered(body:CharacterBody2D):
	if body is player or body is player2:
		print("conexion")
		body.connect("interactuar", self.accion)


func accion():
	
	for light in lights:
		if light:
			light.enabled = !light.enabled
			light.off_with_player()



func _on_area_2d_body_exited(body):
	if body is player or body is player2:
		body.interactuar.disconnect(accion)
