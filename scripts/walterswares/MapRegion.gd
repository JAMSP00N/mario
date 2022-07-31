extends Area2D

export(String, DIR) var microgame_folder
export(Texture) var select_sprite
export(String) var title
export(Color) var color

var highlighted: bool

var parent
var title_label
func _ready():
	parent = get_parent()
	title_label = get_parent().get_parent().get_node("title_label")
	highlighted = false
	pass

func _on_area_entered(area):
	highlighted = true
	if select_sprite:
		parent.texture = select_sprite
	title_label.bbcode_text = "\n[right][wave][color=#" + color.to_html(false) + "]" + tr(title) + " [/color][/wave][/right]"

func _on_area_exited(area):
	highlighted = false
	if parent.default_sprite:
		parent.texture = parent.default_sprite
	title_label.bbcode_text = ""

func _input(event):
	if highlighted && event is InputEventMouseButton && event.pressed:
		print(microgame_folder) # TODO(jam): make this load a queue from specified dir
