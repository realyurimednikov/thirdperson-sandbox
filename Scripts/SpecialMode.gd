extends MeshInstance


export var extended_damage: float = 25


onready var timer = $SpecialModeTimer
onready var regeneration_timer = $RegenerationTimer


var is_activated: bool = false
var remained: float = 100
var can_used: bool = true

func _ready():
	visible = false


func update_ui():
	get_tree().call_group('UI', 'update_special_mode_bar', remained)


func _on_RegenerationTimer_timeout():
	can_used = true
	remained = 100
	print('Can use again')
	regeneration_timer.stop()


func activate():
	if can_used:
		can_used = false
		timer.start()
		print('special mode activated')
		visible = true
		is_activated = true
	else:
		print('cant use special mode')


func _on_SpecialModeTimer_timeout():
	if remained > 0:
		remained -= 10
		update_ui()
	else:
		timer.stop()
		is_activated = false
		if regeneration_timer.is_stopped():
			regeneration_timer.start()
		visible = false
