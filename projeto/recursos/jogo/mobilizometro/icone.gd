extends Node2D

export var textura: Texture

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if textura != null:
		$Sprite.texture = textura


func ativar():
	visible = true
	$AnimationPlayer.play("ativar")

func desativar():
	visible = false
	
