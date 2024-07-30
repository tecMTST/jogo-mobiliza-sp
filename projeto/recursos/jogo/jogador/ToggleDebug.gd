extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#func _on_Area2D_mouse_entered():
#	Global.modo_debug = !Global.modo_debug
#	$Gui.visible = !Global.modo_debug
#	$GuiPressed.visible = Global.modo_debug

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and event.is_pressed():
		Global.modo_debug = !Global.modo_debug
		$Gui.visible = !Global.modo_debug
		$GuiPressed.visible = Global.modo_debug
