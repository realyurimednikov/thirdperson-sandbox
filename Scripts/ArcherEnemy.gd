extends GenericEnemy


#onready var health_bar = $EnemyHealthBar
onready var bow = $Bow

onready var bow_arrow = preload("res://Enemies/BowArrow.tscn")


#func _physics_process(delta):
#	if target:
#		look_at_player()
##		chase(delta)


func _on_Area_body_entered(body):
	on_body_entered(body)
#	if body.is_in_group('Player'):
#		target = body
#		print('Player entered')
#		health_bar.show()


func _on_Area_body_exited(body):
	on_body_exited(body)
#	if body.is_in_group('Player'):
#		target = null
#		print('Player exited')
#		health_bar.hide()


func attack():
	var arrow = bow_arrow.instance()
	
	bow.add_child(arrow)
	
	arrow.look_at(target.transform.origin, Vector3.UP)
	arrow.set_damage(attack_strength)
	arrow.enable()
