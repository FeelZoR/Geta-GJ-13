extends ColorRect

var settings_scene = preload("res://src/UI/SoundSettings.tscn")

onready var resume_btn = $Buttons/Resume
onready var settings_btn = $Buttons/Settings
onready var quit_btn = $Buttons/Quit
onready var audio = $UI_Audio

signal resume
signal _settings_closed
var is_quitting = false

func _input(event):
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			get_tree().get_current_scene()._unpause()
		else:
			get_tree().get_current_scene()._pause()

func _ready():
	resume_btn.text = tr(Settings.RESUME_KEY)
	settings_btn.text = tr(Settings.SETTINGS_KEY)
	quit_btn.text = tr(Settings.QUIT_KEY)

func _on_Resume_pressed():
	audio.play()
	emit_signal("resume")

func _on_Settings_pressed():
	audio.play()
	var settings_node = settings_scene.instance()
	add_child(settings_node)
	settings_node.connect("close", self, "_on_Settings_closed")
	yield(self, "_settings_closed")
	settings_node.queue_free()

func _on_Settings_closed():
	emit_signal("_settings_closed")

func _on_Quit_pressed():
	is_quitting = true
	audio.play()

func _on_UI_Audio_finished():
	if is_quitting:
		get_tree().quit()
