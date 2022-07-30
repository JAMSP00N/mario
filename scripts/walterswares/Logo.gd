extends TextureRect

export(float) var max_rotate_deg = 10.5
export(float) var rotate_speed = 1.8
var rotate_dir: bool

func _ready():
	rotate_dir = (randi() % 2) == 0
	rect_rotation = max_rotate_deg * (-1 if rotate_dir else 1)
	pass

var elapsed: float = 0.0
func _process (dt):
	var start = deg2rad(rect_rotation)
	var goal = deg2rad(max_rotate_deg * (1 if rotate_dir else -1))

	if is_equal_approx(start, goal):
		elapsed = 0.0
		rotate_dir = !rotate_dir
		goal = -goal

	var rotation = lerp_angle(start, goal, ease(elapsed / rotate_speed, -3.2))

	rect_rotation = rad2deg(rotation)

	elapsed += dt
