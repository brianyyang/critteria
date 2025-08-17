class_name CardDraggingState
extends CardState

const DRAG_MINIMUM_THRESHOLD := 0.05
var minimum_drag_time_elapsed := false

func enter() -> void:
	var ui_layer := get_tree().get_first_node_in_group("ui_layer")
	if ui_layer:
		body_part_ui.reparent(ui_layer)

	minimum_drag_time_elapsed = false
	var threshold_timer := get_tree().create_timer(DRAG_MINIMUM_THRESHOLD, false)
	threshold_timer.timeout.connect(func(): minimum_drag_time_elapsed = true)

func on_input(event: InputEvent) -> void:
	var is_mouse_motion := event is InputEventMouseMotion
	var cancel = event.is_action_pressed("right_mouse")
	var confirm = event.is_action_released("left_mouse") or event.is_action_pressed("left_mouse")

	if is_mouse_motion:
		body_part_ui.global_position = body_part_ui.get_global_mouse_position() - body_part_ui.pivot_offset

	if cancel:
		transition_requested.emit(self, CardState.State.Base)
	elif minimum_drag_time_elapsed and confirm:
		get_viewport().set_input_as_handled()
		if body_part_ui.target_drop_points.is_empty():
			transition_requested.emit(self, CardState.State.Base)
		else:
			if not body_part_ui.target_drop_points.is_empty():
				var drop_area = body_part_ui.target_drop_points.get(0) as BodyDropArea
				handle_drop_in_area(drop_area)

func handle_drop_in_area(drop_area: BodyDropArea) -> void:
	if drop_area.occupied:
		drop_area.card_in_area.card_state_machine.reset_state()
	transition_requested.emit(self, CardState.State.Released)
