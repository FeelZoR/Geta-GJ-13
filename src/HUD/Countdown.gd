extends TextureProgress

var _total_duration = null
var _duration = null

func set_effect(duration):
	_total_duration = duration
	_duration = _total_duration

func _process(delta):
	if _duration != null:
		if _duration > 0:
			_duration -= delta
			set_value(_duration / _total_duration * 100)
		else:
			get_tree().get_current_scene().end_boost()
