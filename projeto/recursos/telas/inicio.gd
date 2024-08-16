extends Control


export var proxima_cena: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.pressed:
		TrocadorDeCenas.trocar_cena(proxima_cena.resource_path)
			
