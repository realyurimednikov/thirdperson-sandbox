extends GenericEnemy


#onready var health_bar = $EnemyHealthBar
onready var attack_raycast = $AttackRaycast
onready var animation_player = $knight/AnimationPlayer

#func _physics_process(delta):
#	if target:
#		look_at_player()
#		chase(delta)


func _on_DetectArea_body_entered(body):
	on_body_entered(body)
#	if body.is_in_group('Player'):
#		target = body
#		print('Player entered')
#		if attack_timer.is_stopped():
#			attack_timer.start()
#		health_bar.show()


func _on_DetectArea_body_exited(body):
	on_body_exited(body)
#	if body.is_in_group('Player'):
#		target = null
#		print('Player exited')
#		attack_timer.stop()
#		health_bar.hide()

#func attack():
#	if attack_raycast.is_colliding():
#		if target:
#			target.get_attacked(attack_strength)


func on_walk():
	animation_player.play("Walk")


func on_guard():
	animation_player.stop()
