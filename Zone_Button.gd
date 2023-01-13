extends Button

signal toggle

func _ready():
	connect("toggle", get_parent().get_parent().get_node("Sprite"), "update_zone")

func _on_Zone_Button_pressed():
	emit_signal("toggle", self.get_index())
