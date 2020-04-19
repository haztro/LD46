extends Area2D

var wielder
var has_attacked = 0
var victim = null
var last_pos = 0

var damage = 10
var hit_range = 35

# Called when the node enters the scene tree for the first time.
func _ready():
	# Hand of owner..
	wielder = get_parent().get_parent()

func attack():
	$anim.play("swing")

func _on_anim_animation_finished(anim_name):
	last_pos = 0
	has_attacked = 0

func _process(delta):

	if position.y < -4.5:
		if victim != null and not has_attacked:
			victim.hit(self)
			has_attacked = 1

func _on_MeleeWeapon_body_entered(body):
	print(body)
	if body.name != wielder.name and body.name != "object" and not body is TileMap:
		victim = body

func _on_MeleeWeapon_body_exited(body):
	if body.name != wielder.name:
		victim = null
