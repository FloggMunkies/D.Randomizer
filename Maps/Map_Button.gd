extends Control


var pressed = false
var available = false
export var kong = "DK"
export var zone = ""
var _a = .3
export var logic_bypass= true


# Called when the node enters the scene tree for the first time.
func _ready():
	_load_sprite()
	set_modulate(Color(1,1,1,1))
	$Button.set_tooltip(hint_tooltip)

func _on_item_pressed(_id):
	$Indicator.set_modulate(Color(1,1,1,0))
	$ColorRect2.set_frame_color(Color(50/255.0,50/255.0,50/255.0,1))
	$Hints/Label.text = ""

func _kongmenu_pressed(id):
	$Hints/Label.text = $Hints.kongmenu.get_item_text(id)

func _potionmenu_pressed(id):
	$Hints/Label.text = $Hints.potionmenu.get_item_text(id)

func _barrelmenu_pressed(id):
	$Hints/Label.text = $Hints.barrelmenu.get_item_text(id)

func _gunmenu_pressed(id):
	$Hints/Label.text = $Hints.gunmenu.get_item_text(id)

func _musicmenu_pressed(id):
	$Hints/Label.text = $Hints.musicmenu.get_item_text(id)
	
func _padmenu_pressed(id):
	$Hints/Label.text = $Hints.padmenu.get_item_text(id)
	
func _itemmenu_pressed(id):
	$Hints/Label.text = $Hints.itemmenu.get_item_text(id)
	
func _kasplatmenu_pressed(id):
	var x = 0.7
	match id:
		0:
			$ColorRect2.set_frame_color(Color(x,x,0,1))
		1:
			$ColorRect2.set_frame_color(Color(x,0,0,1))
		2:
			$ColorRect2.set_frame_color(Color(0,x,x,1))
		3:
			$ColorRect2.set_frame_color(Color(x,0,x,1))
		4:
			$ColorRect2.set_frame_color(Color(0,x,0,1))
		_:
			$ColorRect2.set_frame_color(Color(1,1,1,1))

func _hintmenu_pressed(id):
	match id:
		0:
			$Indicator.set_modulate(Color(0,1,0,1))
		1:
			$Indicator.set_modulate(Color(1,0,0,1))
		2:
			$Indicator.set_modulate(Color(1,.6,0,1))
		_:
			$Hints/Label.text = $Hints.hintmenu.get_item_text(id)

func _on_Button_toggled(_button_pressed):
	pressed = !pressed
	$Checkmark.set_visible(pressed)

func logic_update(flag):
	available = flag
	$Button.material.set_shader_param("color", Color(1,1,0,int(available)))

func _process(_delta):
	if available:
		_a = 1
	else:
		_a = 0.3
	if logic_bypass:
		_a = 1
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
