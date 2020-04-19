extends Knight

var player
var king

var direction_vec = Vector2(0, 0)
var can_attack = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_node("Player")
	king = get_parent().get_node("King")
	$attack_cooldown.wait_time = 0.5

func think():
	direction_vec = (player.position - position).normalized()
	direction = direction_vec
	
	if (player.position - position).length() <= $right_hand/MeleeWeapon.hit_range:
		direction = Vector2(0, 0)
#		if can_attack:
#			$right_hand/MeleeWeapon.attack()
#			can_attack = 0
#			$attack_cooldown.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	think()
	
	rotate_head(0.05, PI)
	rotate_body(0.1)
	
	body_dest_angle = direction_vec.angle() + PI/2
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		direction = (direction + collision.normal.rotated(PI/2)).normalized()

func _on_attack_cooldown_timeout():
	can_attack = 1
