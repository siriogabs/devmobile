extends Control

var current_xp := 0.0
var max_xp := 100.0
var level := 1

@onready var circularprogress = $circularprogress
@onready var levellabel = $levellabel

func _ready():
	circularprogress.min_value = 0
	circularprogress.max_value = max_xp
	circularprogress.value = current_xp
	levellabel.text = "Nível: " + str(level)

func _on_timer_timeout() -> void:
	current_xp += 1
	if current_xp >= max_xp:
		current_xp -= max_xp
		level += 1
		max_xp *= 1.1
		circularprogress.max_value = max_xp
		circularprogress.value = current_xp
		levellabel.text = "Nível: " + str(level)
	pass
