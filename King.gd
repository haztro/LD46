extends Knight


var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_node("Player")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$head.rotation = lerp_angle($head.rotation, (player.position - position).angle() - PI/2, 0.05)
