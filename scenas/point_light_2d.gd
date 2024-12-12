extends PointLight2D

@export var collision_layer_to_check: int = 3  # Define qué capa se considera como obstáculo
# Called when the node enters the scene tree for the first time.
@onready var timer := $Timer
var playera
func _ready():
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_area_entered(_area: Node) -> void:
	#if is_occluded(area.global_position):
		#print("target detected")
	#else:
		#timer.start()
		#playera = area
	pass
func is_occluded(target_position: Vector2) -> bool:
	# Lanza un rayo desde el centro de la luz hasta el jugador
	var space_state = get_world_2d().direct_space_state
	var query =  PhysicsRayQueryParameters2D.create(global_position, target_position)
	query.exclude =  [self]
	query.collision_mask = collision_layer_to_check
	var result = space_state.intersect_ray(query)
	# Si el rayo detecta algo, hay un obstáculo
	if result.size() == 0:
		return true
	return result["collider"] is CharacterBody2D


func _on_timer_timeout():
	if is_occluded(playera.global_position):
		print("detec")
		playera.illuminated = true
		timer.stop()


func _on_area_2d_body_entered(body):
	if body is player and enabled:
		if body.illuminated:
			return
		if is_occluded(body.global_position):
			body.illuminated = true
			print("detec")
		else:
			playera = body
			timer.start()


func _on_area_2d_body_exited(body):
	if body is player:
		body.illuminated = false
