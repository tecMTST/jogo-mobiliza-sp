extends AudioStreamPlayer

#Clipes de audio:
onready var clipesSFX = {
	"vinhetas": [
		preload ("res://elementos/audio/bgm/bgm-vinheta-1.mp3"),
		preload ("res://elementos/audio/bgm/bgm-vinheta-2.mp3"),
		preload ("res://elementos/audio/bgm/bgm-vinheta-3.mp3"),
		preload ("res://elementos/audio/bgm/bgm-vinheta-4.mp3")
	]
}

#Gerador de número randômico:
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	stream = clipesSFX.vinhetas[rng.randf_range(0, clipesSFX.vinhetas.size())]
	play()
