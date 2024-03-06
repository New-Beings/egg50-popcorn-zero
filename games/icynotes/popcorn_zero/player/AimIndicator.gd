extends Node2D

var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = $"../.."
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# TODO change this to a signal
	if (player.is_serving()):
		visible = true
	else:
		print('Player Flying, set visible false')
		visible = false
	pass
