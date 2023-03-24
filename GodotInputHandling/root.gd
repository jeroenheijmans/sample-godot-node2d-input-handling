extends Node2D

func _on_button_pressed():
	for n in 15:
		var body = load("res://ball.tscn").instantiate() as RigidBody2D
		body.position = Vector2(randi_range(0, get_viewport_rect().size.x), 50)
		body.linear_velocity = Vector2(randi_range(-500, 200), randi_range(-500, 500))
		self.add_child(body)
