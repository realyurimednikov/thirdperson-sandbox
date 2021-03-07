extends Control


onready var health_bar = $HealthbarContainer/VBoxContainer/Healthbar
onready var special_mode_bar = $HealthbarContainer/VBoxContainer/SpecialModeBar

func _ready():
	add_to_group('UI')

func update_healthbar(health: float):
	health_bar.value = health


func update_special_mode_bar(value: float):
	if value > 0:
		special_mode_bar.visible = true
		special_mode_bar.value = value
	else:
		special_mode_bar.visible = false
