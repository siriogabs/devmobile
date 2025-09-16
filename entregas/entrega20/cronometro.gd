extends Control

@onready var tempo_label = $TempoLabel
@onready var timer = $Timer

var decimos = 0
var segundos = 0
var minutos = 0

func _ready():
	atualizar_label()

func _on_timer_timeout():
	decimos += 1
	if decimos >= 10:
		decimos = 0
		segundos += 1
		if segundos >= 60:
			segundos = 0
			minutos += 1
	atualizar_label()

func atualizar_label():
	var tempo_formatado = "%02d:%02d.%d" % [minutos, segundos, decimos]
	tempo_label.text = tempo_formatado
