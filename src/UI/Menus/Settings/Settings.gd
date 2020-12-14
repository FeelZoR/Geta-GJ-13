extends Panel

onready var click_sound = $Click
onready var general_tab = $Container/General
onready var sound_tab = $Container/Sound

signal end_sound
signal close

func _on_General_pressed():
	click_sound.play()
	general_tab.visible = true
	sound_tab.visible = false

func _on_Sound_pressed():
	click_sound.play()
	general_tab.visible = false
	sound_tab.visible = true

func _on_Cancel_pressed():
	click_sound.play()
	
	yield(self, "end_sound")
	emit_signal("close")

func _on_Confirm_pressed():
	click_sound.play()
	general_tab.save()
	sound_tab.save()
	
	if click_sound.playing:
		yield(self, "end_sound")
	
	emit_signal("close")

func _on_Click_finished():
	emit_signal("end_sound")

func set_in_game():
	general_tab.set_in_game()
