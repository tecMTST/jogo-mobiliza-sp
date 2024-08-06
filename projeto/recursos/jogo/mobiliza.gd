extends Node2D

export var tempo: int = 180
export var total_seguidores: int = 0

onready var _temporizador: Timer = $Temporizador

# Called when the node enters the scene tree for the first time.
func _ready():
	_temporizador.wait_time = tempo
	_temporizador.autostart = false
	_temporizador.start()
	for crianca in $YSort.get_children():
		if 'pessoa' in crianca.name:
			total_seguidores += 1
	$YSort/jogador.alterar_maximo_entregas(total_seguidores)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Temporizador_timeout():
	TrocadorDeCenas.trocar_cena("res://recursos/jogo/fim/fim.tscn")
