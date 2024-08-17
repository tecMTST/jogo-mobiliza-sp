extends Control


export var cena_jogo: PackedScene


onready var texto = $RichTextLabel as RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	var porcentagem_completo := float(Global.pessoas_mobilizadas) / float(Global.total_pessoas)
	var pontuacao := Global.pessoas_mobilizadas
	var bb_texto := """[center]Poxa, você só conseguiu mobilizar {pon} pessoas :(
Tente jogar novamente e mobilizar mais pessoas para os eventos![/center]"""

	if porcentagem_completo <= .05:
		$LinkButton.visible = false

	if .05 < porcentagem_completo and porcentagem_completo < .9:
		bb_texto = """Parabéns, você conseguiu mobilizar {pon} pessoas!
Chegou a hora de mobilizar a cidade de verdade!
Clique no link abaixo para baixar o aplicativo Mobiliza SP e organizados, poderemos melhorar a cidade!"""


	elif porcentagem_completo >= .9:
		bb_texto = """Uau, você conseguiu mobilizar {pon} pessoas!
Com todo esse potencial para mobilizar, chegou a hora de colocar essas habilidades na vida real!
Clique no link abaixo para baixar o aplicativo Mobiliza SP e organizados, poderemos melhorar a cidade!"""


	elif Global.pessoas_mobilizadas == Global.total_pessoas:
		pontuacao = Global.tempo_total - Global.tempo_restante
		bb_texto = """Excelente! Você mobilizou a CIDADE TODA em {pon} segundos!
Com todo esse potencial para mobilizar, chegou a hora de colocar essas habilidades na vida real!
Clique no link abaixo para baixar o aplicativo Mobiliza SP e organizados, poderemos melhorar a cidade!"""


	texto.bbcode_text = bb_texto.format({'pon': pontuacao})



func _on_Button_pressed() -> void:
	TrocadorDeCenas.trocar_cena(cena_jogo.resource_path)
