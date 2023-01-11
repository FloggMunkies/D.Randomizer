extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Logic_update_checks(check_dict):
	var _i = 0
	for _c in $TabContainer.get_children():
		_i = 0
		for _cc in _c.get_node("DK").get_children():
			_cc.logic_update(check_dict[_c.name][_i])
			_i += 1
		if _c.name == "DK Isles":
			_i+=1
			
		for _cc in _c.get_node("Diddy").get_children():
			_cc.logic_update(check_dict[_c.name][_i])
			_i += 1
		if _c.name == "DK Isles":
			_i+=1
			
		for _cc in _c.get_node("Lanky").get_children():
			_cc.logic_update(check_dict[_c.name][_i])
			_i += 1
		if _c.name == "DK Isles":
			_i+=1
					
		for _cc in _c.get_node("Tiny").get_children():
			_cc.logic_update(check_dict[_c.name][_i])
			_i += 1
					
		for _cc in _c.get_node("Chunky").get_children():
			_cc.logic_update(check_dict[_c.name][_i])
			_i += 1
		if _c.name == "DK Isles":
			_i+=1
					
		for _cc in _c.get_node("Kasplat").get_children():
			_cc.logic_update(check_dict[_c.name][_i])
			_i += 1
		
		# Update Shops
		var _cc = _c.get_node("Cranky").get_node("Cranky")
		_cc.logic_update(check_dict[_c.name][_i])
		_i += 1
		_cc = _c.get_node("Funky").get_node("Funky")
		_cc.logic_update(check_dict[_c.name][_i])
		_i += 1
		_cc = _c.get_node("Candy").get_node("Candy")
		_cc.logic_update(check_dict[_c.name][_i])
		_i += 1
		_cc = _c.get_node("Snide").get_node("Snide")
		_cc.logic_update(check_dict[_c.name][_i])
		_i += 1
		
		_cc = _c.get_node("Other").get_node("BattlePad1")
		_cc.logic_update(check_dict[_c.name][_i])
		_i += 1
		
		var check = "Boss"
		if _c.name == "DK Isles":
			check = "BattlePad2"
		_cc = _c.get_node("Other").get_node(check)
		_cc.logic_update(check_dict[_c.name][_i])
		_i += 1
		
		if _c.name == "DK Isles":
			_cc = _c.get_node("Other").get_node("Jetpack")
			_cc.logic_update(check_dict[_c.name][_i])
			_i += 1
		
		if _c.name == "Frantic Factory":
			_cc = _c.get_node("Other").get_node("Arcade")
			_cc.logic_update(check_dict[_c.name][_i])
			_i += 1
		

#		print(_c.name)
#		print("start _i: ", _i)
#		var shops = ["Cranky", "Funky", "Candy"]
#		for name in shops:
#			print("Loop", name, " _i: ", _i)
#			var _cc = _c.get_node("Cranky").get_node("Cranky")
#			if _cc.shop == name:
#				_cc.logic_update(check_dict[_c.name][_i])
#
#			_cc = _c.get_node("Funky").get_node("Funky")
#			if _cc.shop == name:
#				_cc.logic_update(check_dict[_c.name][_i])
#
#			_cc = _c.get_node("Candy").get_node("Candy")
#			if _cc.shop == name:
#				_cc.logic_update(check_dict[_c.name][_i])
#
#			_cc = _c.get_node("Snide").get_node("Snide")
#			if _cc.shop == name:
#				_cc.logic_update(check_dict[_c.name][_i])
#
#			_i += 1
