class_name BodyDropArea
extends Area2D

@export var hovered_sprite: Sprite2D

func _on_body_part_entered(area: Area2D) -> void:
	hovered_sprite.visible = true

func _on_body_part_exited(area: Area2D) -> void:
	hovered_sprite.visible = false
