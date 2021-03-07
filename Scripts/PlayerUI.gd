extends Control


onready var health_bar = $HealthbarContainer/Healthbar


func _ready():
	add_to_group('UI')

func update_healthbar(health: float):
	health_bar.value = health
