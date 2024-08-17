extends Control


export var cena_jogo: PackedScene


onready var texto = $RichTextLabel as RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	var porcentagem_completo := float(Global.pessoas_mobilizadas) / float(Global.total_pessoas)
	var pontuacao := Global.pessoas_mobilizadas
	var bb_texto := """[center]

Poxa, você só conseguiu mobilizar [color=red]{pon}[/color] pessoas :(

Tente jogar novamente e mobilizar mais pessoas para os eventos![/center]"""

	if porcentagem_completo <= .05:
		$BaixarAplicativo.visible = false

	if .05 < porcentagem_completo and porcentagem_completo < .9:
		bb_texto = """[center]Parabéns!

Você conseguiu mobilizar [color=red]{pon}[/color] pessoas!
Chegou a hora de mobilizar a cidade toda [color=red]pra valer[/color]!
[color=red]Toque no coração[/color] para baixar o aplicativo [color=red]Mobiliza SP[/color]![/center]"""


	elif porcentagem_completo >= .9:
		bb_texto = """[center]Uau!

Você conseguiu mobilizar [color=red]{pon}[/color] pessoas!
Com todo esse potencial para mobilizar, chegou a hora de colocar essas habilidades na [color=red]vida real[/color]!
[color=red]Toque no coração[/color] para baixar o aplicativo [color=red]Mobiliza SP[/color]![/center]"""


	elif Global.pessoas_mobilizadas == Global.total_pessoas:
		pontuacao = Global.tempo_total - Global.tempo_restante
		bb_texto = """[center]Excelente!

Você mobilizou a [color=red]CIDADE TODA[/color] em [color=red]{pon}[/color] segundos!
Coloque todo esse potencial mobilizador para melhorar a cidade pra valer!
[color=red]Toque no coração[/color] para baixar o aplicativo [color=red]Mobiliza SP[/color]![/center]"""


	texto.bbcode_text = bb_texto.format({'pon': pontuacao})



func _on_Button_pressed() -> void:
	TrocadorDeCenas.trocar_cena(cena_jogo.resource_path)


func _on_TextureButton_pressed() -> void:
	if OS.has_feature('JavaScript'):
		JavaScript.eval("""
			window.open('https://nucleodetecnologia.com.br/', '_blank').focus();
		""")
	else:
		OS.shell_open("https://nucleodetecnologia.com.br/")
