extends KinematicBody

class_name GenericEnemy

export var health: float = 100
export var attack_strength: float = 5
export var speed: float = 15
export var attack_rate: float = 1
export var is_chasing: bool = true
export var xp_given: float = 5

onready var health_bar = $"./EnemyHealthBar"
onready var attack_timer: Timer

var target


func _ready():
	add_to_group('Enemy')
	
	attack_timer = Timer.new()
	attack_timer.set_one_shot(false)
	attack_timer.set_wait_time(attack_rate)
	attack_timer.connect("timeout", self, "attack")
	add_child(attack_timer)
	
#	on_guard()


func _physics_process(delta):
	if target:
		look_at_player()
		if is_chasing:
			chase(delta)


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
	if target:
		if target.has_method('add_xp'):
			target.add_xp(xp_given)
	on_die()
	queue_free()


func attack():
	if target:
		if target.has_method('get_attacked'):
			target.get_attacked(attack_strength)
			on_attack()


func update_health_bar():
	health_bar.show_health(health)


func chase(delta):
	var direction = (target.transform.origin - transform.origin).normalized()
	move_and_slide(direction * speed * delta, Vector3.UP)
	
	on_walk()


func on_body_entered(body):
	if body.is_in_group('Player'):
		target = body
		print('Player entered')
		health_bar.show()
		if attack_timer.is_stopped():
			attack_timer.start()


func on_body_exited(body):
	if body.is_in_group('Player'):
		target = null
		print('Player exited')
		health_bar.hide()
		attack_timer.stop()
		on_guard()


func on_walk():
	pass


func on_attack():
	pass


func on_die():
	pass


func on_guard():
	pass
