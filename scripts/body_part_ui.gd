class_name BodyPartUI
extends Control

const BODY_SPRITE_WIDTH = 17
const BODY_SPRITE_HEIGHT = 35
const CARD_SPRITE_WIDTH = 19
const CARD_SPRITE_HEIGHT = 42

signal reparent_requested(which_body_part: BodyPartUI)

@export var card_state_machine: CardStateMachine
@export var animal_part: AnimalPart
@export var body_sprite: Sprite2D
@export var card_sprite: Sprite2D
@export var drop_point_detector: Area2D

var target_drop_points: Array[BodyDropArea] = []

# set up sprites, drop area layer + mask, and card state machine
func _ready() -> void:
	var body_sprite_xy = animal_part.getBodySpriteCoordinates()
	body_sprite.region_rect.position.x = body_sprite_xy.x * BODY_SPRITE_WIDTH
	body_sprite.region_rect.position.y = body_sprite_xy.y * BODY_SPRITE_HEIGHT

	var card_sprite_xy = animal_part.getCardSpriteCoordinates()
	card_sprite.region_rect.position.x = card_sprite_xy.x * CARD_SPRITE_WIDTH
	card_sprite.region_rect.position.y = card_sprite_xy.y * CARD_SPRITE_HEIGHT

	var mask = animal_part.getBodyPartDropAreaMask()
	drop_point_detector.set_collision_mask_value(mask, true)

	var layer = animal_part.getBodyPartSelectorLayer()
	drop_point_detector.set_collision_layer_value(layer, true)

	card_state_machine.init(self)

func _input(event: InputEvent) -> void:
	card_state_machine.on_input(event)

func _on_gui_input(event: InputEvent) -> void:
	card_state_machine.on_gui_input(event)

func _on_mouse_entered() -> void:
	card_state_machine.on_mouse_entered()

func _on_mouse_exited() -> void:
	card_state_machine.on_mouse_exited()

func _on_drop_point_detector_area_entered(area: Area2D) -> void:
	if not target_drop_points.has(area):
		target_drop_points.append(area)

func _on_drop_point_detector_area_exited(area: Area2D) -> void:
	target_drop_points.erase(area)
