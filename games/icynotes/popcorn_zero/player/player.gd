extends Node2D

const hit_speed: float = 400.0

var state: int
var facing_degrees: float
var serve_direction: int
var speed: float

# Called when the node enters the scene tree for the first time.
func _ready():
	state = PlayerState.SERVING
	facing_degrees = 0
	serve_direction = 1
	speed = 0.0
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	do_states(delta)
	
	do_move()
	do_action()
	pass

func do_action():
	if (Input.is_action_just_pressed("action1")):
		$Body/Burst.do_burst()
		if (is_serving()):
			state = PlayerState.FLYING
			speed = hit_speed
	
func do_move():
	if (Input.is_action_just_pressed("move_left")):
		position.x -= 20
	elif (Input.is_action_just_pressed("move_right")):
		position.x += 20

func do_states(delta):
	match (state):
		PlayerState.SERVING:
			do_serve(delta)
		PlayerState.FLYING:
			do_flying(delta)	

func do_serve(delta):
	# bounce aim back and forth
	if (abs(facing_degrees) > 90):
		facing_degrees = 90 if facing_degrees > 0 else -90
		serve_direction *= -1
				
	facing_degrees += serve_direction * 60 * delta	
	$Body/AimIndicator.rotation_degrees = facing_degrees

func do_flying(delta):
	var delta_pos: Vector2 = Vector2(speed * delta, 0.0).rotated(deg2rad(facing_degrees))
	position += delta_pos

func is_serving() -> bool:
	return state == PlayerState.SERVING
	
func is_flying() -> bool:
	return state == PlayerState.FLYING
	
func is_interacting() -> bool:
	return state == PlayerState.INTERACTING
	
enum PlayerState {
	SERVING = 0,
	FLYING = 1,
	INTERACTING = 2
}
