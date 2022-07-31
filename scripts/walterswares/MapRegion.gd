extends Area2D

export(String, DIR) var microgame_folder
export(Texture) var select_sprite

var highlighted: bool

var parent
func _ready():
	parent = get_parent()
	highlighted = false
	pass

func _on_area_entered(area):
	highlighted = true
	if select_sprite:
		parent.texture = select_sprite

func _on_area_exited(area):
	highlighted = false
	if parent.default_sprite:
		parent.texture = parent.default_sprite

func _input(event):
	if highlighted && event is InputEventMouseButton && event.pressed:
		print(microgame_folder) # TODO(jam): make this load a queue from specified dir
