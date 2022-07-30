extends Control

export(AudioStream) var bgm

func _ready():
	EventBus.emit_signal("bgm_changed", {"playing": true, "stream": bgm})
