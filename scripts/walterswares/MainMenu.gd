extends Control

func _ready():
	print("good morning")
	EventBus.emit_signal("bgm_changed", {"playing": false})
