extends Control


export var valor_maximo := 100
# valor corresponde ao numero maximo de entregas para continuar sendo do ranking
export var rankings: Array = [
	{ valor = 5, titulo = 'Panfleteiro', tint = Color(1, 0, 0) },
	{ valor = 20, titulo = 'Mobilizador', tint = Color(.5, 0, 0) },
	{ valor = 50, titulo = 'Coordenador de Banca' },
	{ valor = 1000, titulo = 'Lider de Grupo' },
]


onready var progresso := $ProgressBar
onready var texto := $Texto as RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	progresso.max_value = valor_maximo
	progresso.value = 0
	texto.bbcode_text = "[center]%s[/center]" % [rankings[0].titulo]


func alterar_valor_maximo(novo_maximo: int):
	progresso.max_value = novo_maximo


func alterar_valor(novo_valor: int):
	progresso.value = novo_valor
	for ranking in rankings:
		if novo_valor >= ranking.valor:
			continue
		texto.bbcode_text = "[center]%s[/center]" % [ranking.titulo]
		break
	
