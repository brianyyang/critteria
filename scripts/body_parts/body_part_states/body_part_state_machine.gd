class_name BodyPartStateMachine
extends Node

@export var initial_state: BodyPartState

var current_state: BodyPartState
var states := {}

func init(body_part: BodyPartUI) -> void:
	for child in get_children():
		if child is BodyPartState:
			states[child.state] = child
			child.transition_requested.connect(_on_transition_requested)
			child.body_part_ui = body_part

	if initial_state:
		initial_state.enter()
		current_state = initial_state

func on_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_input(event)

func on_gui_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_gui_input(event)

func on_mouse_entered() -> void:
	if current_state:
		current_state.on_mouse_entered()

func on_mouse_exited() -> void:
	if current_state:
		current_state.on_mouse_exited()

func _on_transition_requested(from: BodyPartState, to: BodyPartState.State):
	if from != current_state:
		return

	var new_state: BodyPartState = states[to]
	if not new_state:
		return

	if current_state:
		current_state.exit()

	new_state.enter()
	current_state = new_state

func reset_state() -> void:
	current_state.transition_requested.emit(current_state, BodyPartState.State.Base)
