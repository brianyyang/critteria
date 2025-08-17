class_name CardClickedState
extends CardState

func enter() -> void:
	body_part_ui.drop_point_detector.monitoring = true

func on_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		transition_requested.emit(self, CardState.State.Dragging)
