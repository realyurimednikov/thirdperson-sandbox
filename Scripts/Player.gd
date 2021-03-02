extends KinematicBody


export var speed: float = 10
export var acceleration: float = 5
export var gravity: float = 9.8
export var jumping_power: float = 30
export var attack_damage = 5

export(float, 0.5, 1) var mouse_sensetivity: float = 0.3
export(float, -90, 0) var min_pitch: float = -90
export(float, 0, 90) var max_pitch: float = 90


var velocity: Vector3
var health: float = 100

onready var camera_pivot = $CameraPivot
onready var camera = $CameraPivot/CameraArm/Camera
onready var animation_player = $human/AnimationPlayer
onready var attack_raycast = $AttackRaycast


func _ready():
#	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	# attack
	if Input.is_action_just_pressed("attack"):
		attack()


func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= event.relative.x * mouse_sensetivity
		camera_pivot.rotation_degrees.x -= event.relative.y * mouse_sensetivity
		camera_pivot.rotation_degrees.x = clamp(camera_pivot.rotation_degrees.x, min_pitch, max_pitch)


func _physics_process(delta):
	
	#move
	var direction = Vector3()
	
	if Input.is_action_pressed("move_forward"):
		direction -= transform.basis.z
	elif Input.is_action_pressed("move_backward"):
		direction += transform.basis.z

	if Input.is_action_pressed("move_left"):
		direction -= transform.basis.x
	elif Input.is_action_pressed("move_right"):
		direction += transform.basis.x
	
	if direction != Vector3.ZERO:
		animation_player.play("Walk")
	else:
		animation_player.play("Idle")
	
	direction = direction.normalized()
	
	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta)
	velocity = move_and_slide(velocity, Vector3.UP)


func attack():
	if attack_raycast.is_colliding():
		var coll = attack_raycast.get_collider()
		if coll.is_in_group('Enemy'):
			print('Attack!')
			coll.take_damage(attack_damage)


func get_attacked(damage):
	health -= damage
	print('Player damaged, health: '+ str(health))
