extends Node2D

var lerp_offset := Vector2.ZERO
var selected := false
var mouse_over_body := false

func _on_static_body_2d_mouse_entered(): mouse_over_body = true
func _on_static_body_2d_mouse_exited(): mouse_over_body = false

func _physics_process(delta: float):
	if selected:
		var target = get_global_mouse_position() - lerp_offset
		global_position = lerp(global_position, target, delta * 20)

# Requires the StaticBody2D children to have `input_pickable == true`
func _unhandled_input(event: InputEvent):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if mouse_over_body and not selected and event.is_pressed():
			selected = true
			modulate = Color(1.0, 0.5, 0.5, 0.9)
			lerp_offset = get_local_mouse_position()
			get_viewport().set_input_as_handled()
		if selected and not event.is_pressed():
			selected = false
			modulate = Color(1.0, 1.0, 1.0, 1.0)
