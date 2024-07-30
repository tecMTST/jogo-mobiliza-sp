extends AudioStreamPlayer2D

#Setar variáveis:

#Clipes de audio:
onready var clipesSFX = {
	"caminhar": preload ("res://elementos/audio/sfx/player-caminhar.mp3")
}

#Gerador de número randômico:
#var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_jogador_atividade_player(tipo):
	if !playing and tipo == "andar":
		stream = clipesSFX.caminhar
		play()
	if playing and tipo == "parado":
		stop()
