extends Node2D


export var numero_de_pessoas = 15
export var textura: Texture
# aumento do numero maximo de pessoas
export var recompensa := 0


var aleatorio = RandomNumberGenerator.new()
var pessoas: Array = []
var referencia_jogador: Jogador


onready var barra_de_progresso = $BarraDeProgresso as ProgressBar
onready var texto = $texto_contador

signal atividade_ponto(tipo_ponto,tipo_entrega)

# Called when the node enters the scene tree for the first time.
func _ready():
	aleatorio.randomize()
	barra_de_progresso.max_value = numero_de_pessoas
	texto.alterar_maximo(numero_de_pessoas)
	if textura:
		$Sprite.texture = textura


func _process(delta):
	barra_de_progresso.value = pessoas.size()


func _on_Area2D_body_entered(body: Jogador):
	referencia_jogador = body
	var a_transferir := min(referencia_jogador.quantidade_seguidores(), numero_de_pessoas)
	for i in range(a_transferir):
		retirar_do_jogador(referencia_jogador)
		texto.alterar_valor(pessoas.size())
	

func _on_Area2D_body_exited(body):
	referencia_jogador = null


func retirar_do_jogador(jogador: Jogador):
	var novo_seguidor = referencia_jogador.retirar_seguidor()
	if novo_seguidor == null:
		return
	
	emit_signal("atividade_ponto",numero_de_pessoas,"normal")
	pessoas.append(novo_seguidor)
	if pessoas.size() == numero_de_pessoas:
		referencia_jogador.pontos_de_habilidade += 1
		$Explosao.play("parabens")
		emit_signal("atividade_ponto",numero_de_pessoas,"final")
		referencia_jogador.aumentar_maximo_seguidores(recompensa)
	novo_seguidor.mobilizar(self)


func _on_ControleDeToque_toque_realizado(historico):
	if not referencia_jogador or pessoas.size() >= numero_de_pessoas:
		return
	retirar_do_jogador(referencia_jogador)
	texto.alterar_valor(pessoas.size())
