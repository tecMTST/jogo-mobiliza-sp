extends Node2D

export var tempo: int = 180

onready var _temporizador: Timer = $Temporizador

# Called when the node enters the scene tree for the first time.
func _ready():
	_temporizador.wait_time = tempo
	_temporizador.autostart = false
	_temporizador.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Temporizador_timeout():
	TrocadorDeCenas.trocar_cena("res://recursos/jogo/fim/fim.tscn")
