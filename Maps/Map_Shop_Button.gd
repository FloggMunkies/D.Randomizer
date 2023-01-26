extends Control


var pressed = false
var available = false
export var shop = ""
var _a = .3

signal recheck_logic


# Called when the node enters the scene tree for the first time.
func _ready():
#	_load_sprite()
	set_modulate(Color(1,1,1,1))
#	_update_alpha()
	$Hints.get_popup().add_item("Cranky")
	$Hints.get_popup().add_item("Funky")
	$Hints.get_popup().add_item("Candy")
	$Hints.get_popup().add_item("Snide")
	$Hints.get_popup().add_separator()
	$Hints.get_popup().add_item("-Reset-")
	$Hints.get_popup().connect("id_pressed", self, "_on_item_pressed")
	
	$Button.set_tooltip(hint_tooltip)
	
	var _c = connect("recheck_logic", get_tree().get_root().get_node("Main").get_node("TabContainer").get_node("Logic").get_node("Logic"), "update")

func _on_item_pressed(id):
	shop = $Hints.get_popup().get_item_text(id)
	_load_sprite()
	emit_signal("recheck_logic")
	print(name, " ", shop, " ", available)


#func _on_Button_toggled(button_pressed):
#	pressed = !pressed
#	$Checkmark.set_visible(pressed)

func logic_update(flag):
	available = flag
	$Button.material.set_shader_param("color", Color(1,1,0,int(available)))

#func _process(delta):
#	if available:
#		_a = 1
#	else:
#		_a = 0.3
#	if pressed:
#		_a = 0
#
#	$Button.set_modulate(Color(1, 1, 1, _a))
		

func _load_sprite():
	var new_sprite
	match shop:
		"Cranky":
			new_sprite = load("res://sprites/Cranky_Icon.png")
		"Funky":
			new_sprite = load("res://sprites/Funky_Icon.png")
		"Candy":
			new_sprite = load("res://sprites/Candy_Icon.png")
		"Snide":
			new_sprite = load("res://sprites/Snide_Icon.png")
			
#		"DK":
#			new_sprite = load("res://sprites/DK_Icon.png")
#		"Diddy":
#			new_sprite = load("res://sprites/Diddy_Icon.png")
#		"Lanky":
#			new_sprite = load("res://sprites/Lanky_Icon.png")
#		"Tiny":
#			new_sprite = load("res://sprites/Tiny_Icon.png")
#		"Chunky":
#			new_sprite = load("res://sprites/Chunky_Icon.png")
#		"Kasplat":
#			new_sprite = load("res://sprites/Kasplat_Icon.png")
#		"Battlepad":
#			new_sprite = load("res://sprites/Battlepad_Icon.bmp")
#		"Boss":
#			new_sprite = load("res://sprites/Boss_Icon.png")
#		"Random":
#			new_sprite = load("res://sprites/Mystery_Icon.bmp")
		_:
			new_sprite = load("res://sprites/Shop_Icon.png")
	if new_sprite:
		$Button.set_button_icon(new_sprite)
