extends Control


export var cena_jogo: PackedScene


onready var texto = $RichTextLabel as RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	var porcentagem_completo := float(Global.pessoas_mobilizadas) / float(Global.total_pessoas)
	var pontuacao := Global.pessoas_mobilizadas
	var bb_texto := """[center]

POXA, VOCÊ CONSEGUIU MOBILIZAR SOMENTE [color=red]{pon}[/color] PESSOAS :(

TENTE JOGAR NOVAMENTE MOBILIZANDO AS PESSOAS NOS EVENTOS![/center]"""

	if porcentagem_completo <= .05:
		$BaixarAplicativo.visible = false

	if .05 < porcentagem_completo and porcentagem_completo < .9:
		bb_texto = """[center]PARABÉNS!

VOCÊ CONSEGUIU MOBILIZAR [color=red]{pon}[/color] PESSOAS!
CHEGOU A HORA DE MOBILIZAR A CIDADE TODA [color=red]PRA VALER[/color]!
[color=red]TOQUE NOS BOTÕES[/color] PARA BAIXAR O APLICATIVO [color=red]AMOR POR SP[/color]![/center]"""

	elif porcentagem_completo >= .9:
		bb_texto = """[center]UAU!

VOCÊ CONSEGUIU MOBILIZAR [color=red]{pon}[/color] PESSOAS!
COM TODO ESSE POTENCIAL, CHEGOU A HORA DE COLOCAR SUAS HABILIDADES NA [color=red]VIDA REAL[/color]!
[color=red]TOQUE NOS BOTÕES[/color] PARA BAIXAR O APLICATIVO [color=red]AMOR POR SP[/color]![/center]"""

	if Global.pessoas_mobilizadas == Global.total_pessoas:
		pontuacao = Global.tempo_total - Global.tempo_restante
		bb_texto = """[center]EXCELENTE!

VOCÊ MOBILIZOU A [color=red]CIDADE TODA[/color] EM [color=red]{pon}[/color] SEGUNDOS!
COLOQUE TODO O SEU POTENCIAL PARA MOBILIZAR A CIDADE [color=red]PRA VALER[/color]!
[color=red]TOQUE NOS BOTÕES[/color] PARA BAIXAR O APLICATIVO [color=red]AMOR POR SP[/color]![/center]"""

	texto.bbcode_text = bb_texto.format({'pon': pontuacao})


func _on_Button_pressed() -> void:
	TrocadorDeCenas.trocar_cena(cena_jogo.resource_path)



func _on_PlayStore_pressed() -> void:
	if OS.has_feature('JavaScript'):
		JavaScript.eval("""
			window.open('https://play.google.com/store/apps/details?id=com.tecmtst.mobilizasp', '_blank').focus();
		""")
	else:
		OS.shell_open("https://play.google.com/store/apps/details?id=com.tecmtst.mobilizasp")


func _on_AppStore_pressed() -> void:
	if OS.has_feature('JavaScript'):
		JavaScript.eval("""
			window.open('https://apps.apple.com/br/app/amor-por-s%C3%A3o-paulo/id6587549992', '_blank').focus();
		""")
	else:
		OS.shell_open("https://apps.apple.com/br/app/amor-por-s%C3%A3o-paulo/id6587549992")
