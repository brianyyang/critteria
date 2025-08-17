class_name CardDraggingState
extends CardState

func enter() -> void:
	var ui_layer := get_tree().get_first_node_in_group("ui_layer")
	if ui_layer:
		body_part_ui.reparent(ui_layer)

func on_input(event: InputEvent) -> void:
	var is_mouse_motion := event is InputEventMouseMotion
	var cancel = event.is_action_pressed("right_mouse")
	var confirm = event.is_action_released("left_mouse") or event.is_action_pressed("left_mouse")

	if is_mouse_motion:
		body_part_ui.global_position = body_part_ui.get_global_mouse_position() - body_part_ui.pivot_offset

	if cancel:
		transition_requested.emit(self, CardState.State.Base)
	elif confirm:
		get_viewport().set_input_as_handled()
		transition_requested.emit(self, CardState.State.Released)
