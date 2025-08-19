extends Control

func _ready():
	$calculobotao.connect("pressed", self, "_on_calculobotao_pressed")
	var options = ["+", "-", "*", "/"]
	for option in options:
		$operacao.add_item(option)


func _on_calculobotao_pressed():
	var num1_text = $numero1.text
	var num2_text = $numero2.text
	
	var num1 = float(num1_text) if num1_text.is_valid_float() else null
	var num2 = float(num2_text) if num2_text.is_valid_float() else null
	
	if num1 == null or num2 == null:
		$resultado.text = "Por favor, insira números válidos."
		return
	
	var operation = $operacao.get_selected_id()
	var result = 0.0
	
	match operation:
		0:
			result = num1 + num2
		1:
			result = num1 - num2
		2:
			result = num1 * num2
		3:
			if num2 == 0:
				$resultado.text = "Erro: divisão por zero"
				return
			else:
				result = num1 / num2
		_:
			$resultado.text = "Operação inválida"
			return
	
	$resultado.text = "Resultado: " + str(result)
