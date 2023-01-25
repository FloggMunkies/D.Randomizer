extends Control


var pressed = false
var available = false
export var kong = "DK"
export var zone = ""
var _a = .3


# Called when the node enters the scene tree for the first time.
func _ready():
	_load_sprite()
	set_modulate(Color(1,1,1,1))
#	_update_alpha()
	$Hints.get_popup().add_item("GB")
	$Hints.get_popup().add_item("BP")
	$Hints.get_popup().add_item("Coin")
	$Hints.get_popup().add_item("Crown")
	$Hints.get_popup().add_item("Key")
	$Hints.get_popup().add_item("Kong")
	$Hints.get_popup().add_item("Medal")
	$Hints.get_popup().add_item("Move")
	$Hints.get_popup().add_item("Other")
	$Hints.get_popup().add_separator()
	$Hints.get_popup().add_item("Hint: Way of the Hoard")
	$Hints.get_popup().add_item("Hint: Might Need")
	$Hints.get_popup().add_item("Hint: Foolish")
	$Hints.get_popup().add_separator()
	$Hints.get_popup().add_item("-Reset-")
	$Hints.get_popup().connect("id_pressed", self, "_on_item_pressed")
	
	$Button.set_tooltip(hint_tooltip)

func _on_item_pressed(id):
	match id:
		10:
			$Indicator.set_modulate(Color(0,1,0,1))
		11:
			$Indicator.set_modulate(Color(1,.6,0,1))
		12:
			$Indicator.set_modulate(Color(1,0,0,1))
		14:
			$Indicator.set_modulate(Color(1,1,1,0))
			$Hints.text = ""
		_:
			$Hints.text = $Hints.get_popup().get_item_text(id)


func _on_Button_toggled(button_pressed):
	pressed = !pressed
	$Checkmark.set_visible(pressed)

func logic_update(flag):
	available = flag
	$Button.material.set_shader_param("color", Color(1,1,0,int(available)))

func _process(delta):
	if available:
		_a = 1
	else:
		_a = 0.3
	if pressed:
		_a = 0
	
	$Button.set_modulate(Color(1, 1, 1, _a))
		

func _load_sprite():
	var new_sprite
	match kong:
		"DK":
			new_sprite = load("res://sprites/DK_Icon.png")
		"Diddy":
			new_sprite = load("res://sprites/Diddy_Icon.png")
		"Lanky":
			new_sprite = load("res://sprites/Lanky_Icon.png")
		"Tiny":
			new_sprite = load("res://sprites/Tiny_Icon.png")
		"Chunky":
			new_sprite = load("res://sprites/Chunky_Icon.png")
		"Kasplat":
			new_sprite = load("res://sprites/Kasplat_Icon.png")
		"Battlepad":
			new_sprite = load("res://sprites/Battlepad_Icon.bmp")
		"Boss":
			new_sprite = load("res://sprites/Boss_Icon.png")
		"Random":
			new_sprite = load("res://sprites/Mystery_Icon.bmp")
		"Jetpac":
			new_sprite = load("res://sprites/Jetpac_Icon.png")
		"Arcade":
			new_sprite = load("res://sprites/Arcade_Icon.png")
		"Fairy":
			new_sprite = load("res://sprites/Fairy_Icon.png")
		"Dirt":
			new_sprite = load("res://sprites/Dirt_Icon.png")
		_:
			new_sprite = load("res://sprites/DK_Icon.png")
	if new_sprite:
		$Button.set_button_icon(new_sprite)
