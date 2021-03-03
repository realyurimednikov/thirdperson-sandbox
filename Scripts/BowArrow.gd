extends RigidBody


var damage: float = 10
var is_shoot: bool = false
var speed: float = 15


func _ready():
	set_as_toplevel(true)
	

func set_speed(s):
	speed = s


func set_damage(d):
	damage = d


func enable():
	is_shoot = true


func _physics_process(delta):
	if is_shoot:
		apply_impulse(transform.basis.z, -transform.basis.z * speed)

func _on_Area_body_entered(body):
	if body.is_in_group('Player'):
		body.get_attacked(damage)
	queue_free()
