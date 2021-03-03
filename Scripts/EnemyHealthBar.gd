extends Sprite3D

onready var progress = $Viewport/TextureProgress
onready var viewport = $Viewport

func _ready():
	texture = viewport.get_texture()
	progress.value = 100
	hide()

func show_health(health):
	progress.value = health


func show():
	visible = true


func hide():
	visible = false
