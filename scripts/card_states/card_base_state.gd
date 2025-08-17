class_name CardBaseState
extends CardState

func enter() -> void:
	if not body_part_ui.is_node_ready():
		await body_part_ui.ready

	body_part_ui.reparent_requested.emit(body_part_ui)
	body_part_ui.pivot_offset = Vector2.ZERO

func on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
		body_part_ui.pivot_offset = body_part_ui.get_global_mouse_position() - body_part_ui.global_position
		transition_requested.emit(self, CardState.State.Clicked)
