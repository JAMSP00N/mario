extends Area2D

export(String, DIR) var microgame_folder
export(Texture) var select_sprite

var parent
func _ready():
	parent = get_parent()
	pass

func _on_mouse_exited():
	if parent.default_sprite:
		parent.texture = parent.default_sprite

func _on_input(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.pressed:
		print(microgame_folder)
	elif event is InputEventMouseMotion:
		parent.texture = select_sprite
