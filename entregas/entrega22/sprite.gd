extends Node2D

@onready var _animated_sprite = $AnimatedSprite2D

func _process(_delta):
	if Input.is_action_pressed("ui_accept"):
		_animated_sprite.play("default")
	else:
		_animated_sprite.stop()
