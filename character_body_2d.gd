extends CharacterBody2D
class_name player
var colora
var speed = 100.0
var illuminated = false
func _ready():
	$AnimatedSprite2D.play("static")

func _physics_process(_delta):
	var directiony = Input.get_axis("ui_up", "ui_down")
	var directionx = Input.get_axis("ui_left", "ui_right")
	if directionx:
		velocity.x = directionx * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	if directiony:
		velocity.y = directiony * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)
	move_and_slide()


func _on_canvas_modulate_visibility_changed():
	print("change")


func _on_light_occluder_2d_hidden():
	print("change")
