extends TouchScreenButton


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var mutado := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Mutar_pressed() -> void:
	# de https://forum.godotengine.org/t/mute-button-sounds-on-all-scenes/8964
	mutado = !mutado
	var bus_idx = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(bus_idx, mutado)
	$Sprite.visible = mutado

func _notification(what):
	var bus_idx = AudioServer.get_bus_index("Master")
	if what == MainLoop.NOTIFICATION_WM_FOCUS_IN:
		AudioServer.set_bus_mute(bus_idx, false)
	elif what == MainLoop.NOTIFICATION_WM_FOCUS_OUT:
		AudioServer.set_bus_mute(bus_idx, true)
