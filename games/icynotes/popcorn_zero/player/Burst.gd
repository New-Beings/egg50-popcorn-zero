extends Node2D

const radius_max: float = 10.0

var bursting: bool = false
var radius: float = 5.0
var color: Color

# Called when the node enters the scene tree for the first time.
func _ready():
	color.a = 0.0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (bursting):
		radius += 200.0 * delta
		if (color.a > 0.0):
			color.a -= 5 * delta
		if (color.a < 0.0):
			color.a = 0.0
			bursting = false
		# queue_redraw()

func _draw():
	if (bursting):
		draw_arc(position, radius, 0, TAU, 360, color, 3.0)
	
func do_burst():
	bursting = true
	radius = 5.0
	color = Color.white
