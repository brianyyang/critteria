class_name BodyPartClickedState
extends BodyPartState

func enter() -> void:
	body_part_ui.drop_point_detector.monitoring = true
	body_part_ui.top_tooltip.visible = false
	body_part_ui.bot_tooltip.visible = false

func on_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		transition_requested.emit(self, BodyPartState.State.Dragging)
