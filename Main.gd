extends Node2D

export (PackedScene) var enemy

var enemies = {}
var enemy_id = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	
	$Player.connect("dead", self, "game_over")
	$King.connect("dead", self, "game_over")
	
	for i in range(5):
		enemies[enemy_id] = enemy.instance()
		enemies[enemy_id].init(enemy_id, Vector2(i * 50, 0), 100, 40)
		enemies[enemy_id].connect("dead", self, "handle_death")
		add_child(enemies[enemy_id])
		enemy_id += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func game_over(entity):
	pass

func handle_death(entity):
	print("DEAD")
	entity.queue_free()
	remove_child(entity)
	
