extends KinematicBody

class_name GenericEnemy

export var health: float = 100
export var attack_strength: float = 5
export var speed: float = 15

var target


func _ready():
	add_to_group('Enemy')


func look_at_player():
	look_at(target.transform.origin, Vector3.UP)


func take_damage(dmg):
	print('damage is ' + str(dmg))
	if health > dmg:
		health -= dmg
		print('Attacked, health = ' + str(health))
		update_health_bar()
	else:
		die()


func die():
	print('I died! ' + name)
	queue_free()


func attack():
	if target:
		target.get_attacked(attack_strength)


func update_health_bar():
	pass


func chase(delta):
	var direction = (target.transform.origin - transform.origin).normalized()
	move_and_slide(direction * speed * delta, Vector3.UP)
