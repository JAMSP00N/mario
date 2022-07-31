extends Area2D

# We're doing this because it's easier than working out what viewport or Control node
# or whatever other layer is between the user and the scene instance is gobbling up
# mouse inputs and making normal motion / click checking impossible.

func _process(dt):
	position = get_viewport().get_mouse_position()