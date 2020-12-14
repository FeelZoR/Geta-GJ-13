extends Control

const MIN_DB = -36

onready var global_title = $Margin/Container/Title
onready var sound = $UI_Sound

onready var master_title = $Margin/Container/Master/Title
onready var master_bar = $Margin/Container/Master/Bar

onready var bgm_title = $Margin/Container/BGM/Title
onready var bgm_bar = $Margin/Container/BGM/Bar

onready var sfx_title = $Margin/Container/SFX/Title
onready var sfx_bar = $Margin/Container/SFX/Bar

onready var ui_title = $Margin/Container/UI/Title
onready var ui_bar = $Margin/Container/UI/Bar

func _ready():
	global_title.text = tr(Settings.SOUND_SETTINGS_KEY)
	
	_initialize(master_bar, Settings.MASTER_BUS)
	_initialize(bgm_bar, Settings.BGM_BUS)
	_initialize(sfx_bar, Settings.SFX_BUS)
	_initialize(ui_bar, Settings.UI_BUS)
	
	_update_settings(master_title, master_bar, Settings.MASTER_SETTINGS_KEY)
	_update_settings(bgm_title, bgm_bar, Settings.BGM_SETTINGS_KEY)
	_update_settings(sfx_title, sfx_bar, Settings.SFX_SETTINGS_KEY)
	_update_settings(ui_title, ui_bar, Settings.UI_SOUNDS_SETTINGS_KEY)

func _initialize(bar, bus_name):
	var bus_id = AudioServer.get_bus_index(bus_name)
	if AudioServer.is_bus_mute(bus_id):
		bar.set_value(0)
	else:
		bar.set_value(_get_bar_value(AudioServer.get_bus_volume_db(bus_id)))

func _update_settings(title, bar, key):
	var intensity = bar.value
	title.text = tr(key) + " (" + str(intensity) + "%)"
	
func _get_bar_value(db_intensity):
	return (1 - (db_intensity / MIN_DB)) * 100

##### SLIDER HANDLING #####
func _on_MasterBar_value_changed(_value):
	_update_settings(master_title, master_bar, Settings.MASTER_SETTINGS_KEY)

func _on_BgmBar_value_changed(_value):
	_update_settings(bgm_title, bgm_bar, Settings.BGM_SETTINGS_KEY)

func _on_SfxBar_value_changed(_value):
	_update_settings(sfx_title, sfx_bar, Settings.SFX_SETTINGS_KEY)

func _on_UiBar_value_changed(_value):
	_update_settings(ui_title, ui_bar, Settings.UI_SOUNDS_SETTINGS_KEY)

##### CLOSE UI #####
func _get_db_intensity(percentage):
	return -(percentage * MIN_DB) / 100 + MIN_DB
	
func _update_intensity(bar_value, bus_name):
	var bus_id = AudioServer.get_bus_index(bus_name)
	if bar_value == 0:
		AudioServer.set_bus_mute(bus_id, true)
	else:
		AudioServer.set_bus_mute(bus_id, false)
		AudioServer.set_bus_volume_db(bus_id, _get_db_intensity(bar_value))
	
func save():
	_update_intensity(master_bar.value, Settings.MASTER_BUS)
	_update_intensity(bgm_bar.value, Settings.BGM_BUS)
	_update_intensity(sfx_bar.value, Settings.SFX_BUS)
	_update_intensity(ui_bar.value, Settings.UI_BUS)
