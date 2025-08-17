class_name CardBaseState
extends BodyPartState

const BASE_MINIMUM_THRESHOLD := 0.05
var minimum_time_elapsed := false

func enter() -> void:
	if not body_part_ui.is_node_ready():
		await body_part_ui.ready

	body_part_ui.card_sprite.modulate = Color(1, 1, 1)
	body_part_ui.reparent_requested.emit(body_part_ui)
	body_part_ui.pivot_offset = Vector2.ZERO
	body_part_ui.top_tooltip.visible = false
	body_part_ui.bot_tooltip.visible = false

	minimum_time_elapsed = false
	var threshold_timer := get_tree().create_timer(BASE_MINIMUM_THRESHOLD, false)
	threshold_timer.timeout.connect(func(): minimum_time_elapsed = true)

func on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse"):
		body_part_ui.pivot_offset = body_part_ui.get_global_mouse_position() - body_part_ui.global_position
		transition_requested.emit(self, BodyPartState.State.Clicked)

func on_mouse_entered() -> void:
	if minimum_time_elapsed:
		body_part_ui.card_sprite.modulate = Color(1.2, 1.2, 1.2)
		body_part_ui.top_tooltip.visible = true

func on_mouse_exited() -> void:
	body_part_ui.card_sprite.modulate = Color(1, 1, 1)
	body_part_ui.top_tooltip.visible = false

func exit() -> void:
	body_part_ui.top_tooltip.visible = false
