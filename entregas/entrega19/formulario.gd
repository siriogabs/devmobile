extends Control

@onready var name_input = $VBoxContainer/HBoxContainer/NameInput
@onready var age_input = $VBoxContainer/HBoxContainer2/AgeInput
@onready var result_label = $VBoxContainer/ResultLabel

func _on_submit_pressed():
	var nome = name_input.text.strip_edges()
	var idade = age_input.text.strip_edges()

	if nome != "" and idade != "":
		result_label.text = "Nome: %s | Idade: %s" % [nome, idade]
	else:
		result_label.text = "Por favor, preencha todos os campos."

func _on_submit_button_pressed() -> void:
	pass 
