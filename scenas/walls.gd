# En tu script principal
extends Node2D

func _ready():
	var light = $"../../PointLight2D"
	
	# Configura el oclusor
	var occluder = LightOccluder2D.new()
	occluder.set_shape(Rect2(Vector2(0, 0), Vector2(16, 16)))  # Ajusta según el tamaño del tile
	add_child(occluder)
	
	# Asigna la máscara de luz
	occluder.set_occluder_light_mask(1)  # Ajusta según tu configuración
	light.set_item_cull_mask(1)  # Asegúrate de que coincidan
