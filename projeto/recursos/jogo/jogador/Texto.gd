extends RichTextLabel


func _process(delta: float) -> void:
	var temporizador = get_parent().get_parent().temporizador
	
	self.bbcode_text = "[center]%s[/center]" % floor(temporizador.time_left)
