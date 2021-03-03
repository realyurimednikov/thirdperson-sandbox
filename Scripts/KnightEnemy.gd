extends GenericEnemy


onready var attack_timer = $Timer
onready var health_bar = $EnemyHealthBar
onready var attack_raycast = $AttackRaycast


func _physics_process(delta):
	if target:
		look_at_player()
		chase(delta)


func _on_DetectArea_body_entered(body):
	if body.is_in_group('Player'):
		target = body
		print('Player entered')
		if attack_timer.is_stopped():
			attack_timer.start()
		health_bar.visible = true


func _on_DetectArea_body_exited(body):
	if body.is_in_group('Player'):
		target = null
		print('Player exited')
		attack_timer.stop()
		health_bar.visible = false


func _on_Timer_timeout():
#	attack()
	if attack_raycast.is_colliding():
		attack()

func update_health_bar():
	health_bar.show_health(health)
