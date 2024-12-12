extends Node

@onready var players := {
	"1": {
		Viewport = $HBoxContainer/SubViewportContainer/SubViewport,
		player = $/PLayer/player.tscn,
		camera = $HBoxContainer/SubViewportContainer/SubViewport/Camera2D
	},
	"2": {
		Viewport = $HBoxContainer/SubViewportContainer2/SubViewport,
		player2 = $/PLayer/player2.tscn,
		camera = $HBoxContainer/SubViewportContainer2/SubViewport/Camera2D
	}
}
func _ready():
	players["2"].viewport.world_2d = players["1"].viewport.world_2d
	for node in players.values():
		var remote_transform := RemoteTransform2D.new()
		remote_transform.remote_path = node.camera.get_path()
	
