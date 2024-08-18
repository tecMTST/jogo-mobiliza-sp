extends AudioStreamPlayer2D

#Setar variáveis:

#Clipes de audio:
onready var clipesSFX = {
	"seguir": [
		preload ("res://elementos/audio/sfx/pop-1.mp3"),
		preload ("res://elementos/audio/sfx/pop-2.mp3"),
		preload ("res://elementos/audio/sfx/pop-3.mp3")
	],
	"mobilizar": preload ("res://elementos/audio/sfx/ponto-entrega.mp3")
}

#Gerador de número randômico:
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_pessoa_atividade_npc(tipo):
	rng.randomize()
	if tipo == "seguindo":
		stop()
		stream = clipesSFX.seguir[rng.randf_range(0, clipesSFX.seguir.size())]
		play()
	elif tipo == "mobilizado" and !Global.modo_debug:
		stop()
		stream = clipesSFX.mobilizar
		play()
	
	
