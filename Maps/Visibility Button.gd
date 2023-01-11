extends CheckButton

func _ready():
	pass # Replace with function body.


func _on_Visibility_Button_pressed():
	var _i = 0
	for _c in self.get_children():
		if not (_c is Label) and not (_c is ColorRect):
			if _c.modulate.a == 1:
				_c.modulate.a = .1
			else:
				_c.modulate.a = 1
