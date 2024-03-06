extends Node2D

func _draw():
	draw_line(position - Vector2(10, 0), position + Vector2(10, 0), Color.white, 3.0)
