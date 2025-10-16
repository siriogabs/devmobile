extends Node2D

@onready var _animated_sprite = $AnimatedSprite2D
@onready var _button = $Button

var _is_playing_from_button = false

func _ready():
	_update_button_text()
	_button.pressed.connect(_on_button_pressed)

func _process(_delta):
	if Input.is_action_pressed("ui_accept"):
		_animated_sprite.play("default")
		_is_playing_from_button = false
	elif not _is_playing_from_button:
		_animated_sprite.stop()
	
	_update_button_text()

func _on_button_pressed():
	if _animated_sprite.is_playing():
		_animated_sprite.stop()
		_is_playing_from_button = false
	else:
		_animated_sprite.play("default")
		_is_playing_from_button = true

	_update_button_text()

func _update_button_text():
	if _animated_sprite.is_playing():
		_button.set_text("Parar animação")
	else:
		_button.set_text("Executar animação")
