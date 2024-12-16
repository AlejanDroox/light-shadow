extends Node2D


@export var parent_node: Node
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
@export var value: bool

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_area_2d_body_entered1(body:CharacterBody2D):
	if body is player or body is player2:
		print("conexion")
		body.connect("interactuar", self.accion)

# Nodo padre que contiene los PointLight2D
# Función para habilitar o deshabilitar las luces
func cambiar_luces():
	for child in parent_node.get_children():
			child.enabled = value

func accion():
	print("skadhj")
	$Sprite2D.flip_v = !$Sprite2D.flip_v
	cambiar_luces()
	
	

func _on_area_2d_body_exited1(body):
	if body is player or body is player2:
		body.interactuar.disconnect(accion)
