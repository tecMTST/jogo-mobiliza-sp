extends AudioStreamPlayer2D

#Setar variáveis:

#Clipes de audio:
onready var clipesSFX = {
	"comicioOK": preload ("res://elementos/audio/sfx/ponto-comicio-finalizado.mp3"),
	"barracaOK": preload ("res://elementos/audio/sfx/ponto-barraca-finalizado.mp3"),
	"atoOK": preload ("res://elementos/audio/sfx/ponto-ato-finalizado.mp3"),
	"mobilizadoAlt": preload ("res://elementos/audio/sfx/ponto-entrega.mp3"),
}

#Gerador de número randômico:
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_ponto_de_entrega_atividade_ponto(tipo_ponto,tipo_entrega):
	if tipo_entrega == "normal" and Global.modo_debug:
			stop()
			stream = clipesSFX.mobilizadoAlt
			play()
	elif tipo_entrega == "final":
		if tipo_ponto == 5:
			stop()
			stream = clipesSFX.barracaOK
			play()
		elif tipo_ponto == 20:
			stop()
			stream = clipesSFX.atoOK
			play()
		elif tipo_ponto == 50:
			stop()
			stream = clipesSFX.comicioOK
			play()
