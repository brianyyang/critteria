class_name Hand
extends HBoxContainer

func _ready() -> void:
	for child in get_children():
		var body_part_ui := child as BodyPartUI
		body_part_ui.reparent_requested.connect(_on_body_part_ui_reparent_requested)

func _on_body_part_ui_reparent_requested(child: BodyPartUI) -> void:
	child.reparent(self)
