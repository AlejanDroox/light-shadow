extends CharacterBody2D
class_name player
var colora
var speed = 100.0
var illuminated = false
signal interactuar
var cotact_ligth: Array
func _ready():
	$AnimatedSprite2D.play("static")
	time_label.text = "Tiempo: 0.00"  # Inicializa el texto del Label
var tiempo_restante: float = 10.0
var temporizador_activado: bool = false
@export var spwan: Marker2D
@export var tiempo_total: float = 10.0  # Tiempo total en segundos
@export var time_label: Label

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
func _input(event):
	if event.is_action_pressed("interactuar1"):
		print("asdsd")
		emit_signal("interactuar")

func _process(delta: float) -> void:
	if temporizador_activado:
		# Resta el tiempo del temporizador
		tiempo_restante -= delta

		# Actualiza el texto del Label
		time_label.text = str(round(tiempo_restante * 100) / 100)

		# Verifica si el tiempo ha llegado a cero
		if tiempo_restante <= 0:
			detener_temporizador()
			respawn()
	verificar_condiciones()

# Función para activar el temporizador
func activar_temporizador():
	if !temporizador_activado:
		temporizador_activado = true

# Función para detener el temporizador
func detener_temporizador():
	temporizador_activado = false
	time_label.text = "Don´t Touch the Shadow" 

func verificar_condiciones():
	if !illuminated:
		activar_temporizador()
	else:
		detener_temporizador()

func respawn():
	global_position = spwan.global_position
	tiempo_restante = 10.0
