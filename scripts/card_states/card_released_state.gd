class_name CardReleasedState
extends CardState

const CARD_SPRITE_OFFSET = Vector2(BodyPartUI.CARD_SPRITE_WIDTH, BodyPartUI.CARD_SPRITE_HEIGHT)
var in_combo_area: bool
var combo_area: BodyDropArea

func enter() -> void:
	in_combo_area = false
	if not body_part_ui.target_drop_points.is_empty():
		in_combo_area = true
		var drop_area = body_part_ui.target_drop_points.get(0) as BodyDropArea
		drop_area.occupied = true
		drop_area.card_in_area = body_part_ui
		body_part_ui.position = drop_area.global_position - CARD_SPRITE_OFFSET
		combo_area = drop_area

func on_input(_event: InputEvent) -> void:
	if in_combo_area:
		return
	transition_requested.emit(self, CardState.State.Base)

func on_gui_input(event: InputEvent) -> void:
	if in_combo_area:
		if event.is_action_pressed("left_mouse"):
			in_combo_area = false
			combo_area.occupied = false
			combo_area.card_in_area = null
			combo_area = null
			body_part_ui.pivot_offset = body_part_ui.get_global_mouse_position() - body_part_ui.global_position
			transition_requested.emit(self, CardState.State.Clicked)
	else:
		transition_requested.emit(self, CardState.State.Base)

func on_mouse_entered() -> void:
	body_part_ui.card_sprite.modulate = Color(1.2, 1.2, 1.2)

func on_mouse_exited() -> void:
	body_part_ui.card_sprite.modulate = Color(1, 1, 1)
