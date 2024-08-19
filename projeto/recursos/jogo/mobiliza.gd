extends Node2D

export var tempo: int = 180
export var total_seguidores: int = 0

onready var _temporizador: Timer = $Temporizador
onready var jogador = $YSort/jogador as Jogador

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.tempo_total = tempo
	_temporizador.wait_time = tempo
	_temporizador.autostart = false

	jogador.barra_tempo.max_value = _temporizador.wait_time
	jogador.barra_tempo.value = _temporizador.wait_time
	
	_temporizador.start()
	for crianca in $YSort.get_children():
		if 'pessoa' in crianca.name:
			total_seguidores += 1
	jogador.alterar_maximo_entregas(total_seguidores)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if total_seguidores == jogador.total_entregues:
		finalizar_jogo()

func finalizar_jogo():
	Global.total_pessoas = total_seguidores
	Global.pessoas_mobilizadas = jogador.total_entregues
	TrocadorDeCenas.trocar_cena("res://recursos/jogo/fim/fim.tscn")
	

func _on_Temporizador_timeout():
	finalizar_jogo()
