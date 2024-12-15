extends CharacterBody2D
class_name player2
var colora
var speed = 100.0
signal interactuar
func _ready():
	pass

func _physics_process(_delta):
	var directiony = Input.get_axis("mov_up", "mov_down")
	var directionx = Input.get_axis("mov_left", "mov_rigth")
	if directionx:
		velocity.x = directionx * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	if directiony:
		velocity.y = directiony * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)
	move_and_slide()

func _input(event):
	if event.is_action_pressed("interactuar2"):
		emit_signal("interactuar")
