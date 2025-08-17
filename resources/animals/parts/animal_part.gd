class_name AnimalPart
extends Resource

enum BodyPart { Head, Torso, Lower }

@export var animal: Animal
@export var body_part: BodyPart

# returns the x and y coordinates for the sprite sheet for this body part
func getBodySpriteCoordinates() -> Vector2:
	var coordinate = Vector2(-1, -1)
	match [animal.animal_type, body_part]:
		[Animal.Type.Beetle, BodyPart.Lower]:
			coordinate = Vector2(0, 0)
		[Animal.Type.Beetle, BodyPart.Torso]:
			coordinate = Vector2(1, 0)
		[Animal.Type.Beetle, BodyPart.Head]:
			coordinate = Vector2(2, 0)

		[Animal.Type.Cat, BodyPart.Lower]:
			coordinate = Vector2(3, 0)
		[Animal.Type.Cat, BodyPart.Torso]:
			coordinate = Vector2(4, 0)
		[Animal.Type.Cat, BodyPart.Head]:
			coordinate = Vector2(5, 0)

		[Animal.Type.Turtle, BodyPart.Lower]:
			coordinate = Vector2(6, 0)
		[Animal.Type.Turtle, BodyPart.Torso]:
			coordinate = Vector2(7, 0)
		[Animal.Type.Turtle, BodyPart.Head]:
			coordinate = Vector2(8, 0)

		[Animal.Type.Frog, BodyPart.Lower]:
			coordinate = Vector2(9, 0)
		[Animal.Type.Frog, BodyPart.Torso]:
			coordinate = Vector2(10, 0)
		[Animal.Type.Frog, BodyPart.Head]:
			coordinate = Vector2(11, 0)

		[Animal.Type.Chimpanzee, BodyPart.Lower]:
			coordinate = Vector2(0, 1)
		[Animal.Type.Chimpanzee, BodyPart.Torso]:
			coordinate = Vector2(1, 1)
		[Animal.Type.Chimpanzee, BodyPart.Head]:
			coordinate = Vector2(2, 1)

		[Animal.Type.Horse, BodyPart.Lower]:
			coordinate = Vector2(3, 1)
		[Animal.Type.Horse, BodyPart.Torso]:
			coordinate = Vector2(4, 1)
		[Animal.Type.Horse, BodyPart.Head]:
			coordinate = Vector2(5, 1)

		[Animal.Type.Capybara, BodyPart.Lower]:
			coordinate = Vector2(6, 1)
		[Animal.Type.Capybara, BodyPart.Torso]:
			coordinate = Vector2(7, 1)
		[Animal.Type.Capybara, BodyPart.Head]:
			coordinate = Vector2(8, 1)

		[Animal.Type.Dolphin, BodyPart.Lower]:
			coordinate = Vector2(9, 1)
		[Animal.Type.Dolphin, BodyPart.Torso]:
			coordinate = Vector2(10, 1)
		[Animal.Type.Dolphin, BodyPart.Head]:
			coordinate = Vector2(11, 1)

		[Animal.Type.Hippo, BodyPart.Lower]:
			coordinate = Vector2(0, 2)
		[Animal.Type.Hippo, BodyPart.Torso]:
			coordinate = Vector2(1, 2)
		[Animal.Type.Hippo, BodyPart.Head]:
			coordinate = Vector2(2, 2)

		[Animal.Type.Camel, BodyPart.Lower]:
			coordinate = Vector2(3, 2)
		[Animal.Type.Camel, BodyPart.Torso]:
			coordinate = Vector2(4, 2)
		[Animal.Type.Camel, BodyPart.Head]:
			coordinate = Vector2(5, 2)

		[Animal.Type.Ostrich, BodyPart.Lower]:
			coordinate = Vector2(6, 2)
		[Animal.Type.Ostrich, BodyPart.Torso]:
			coordinate = Vector2(7, 2)
		[Animal.Type.Ostrich, BodyPart.Head]:
			coordinate = Vector2(8, 2)

		[Animal.Type.Crocodile, BodyPart.Lower]:
			coordinate = Vector2(9, 2)
		[Animal.Type.Crocodile, BodyPart.Torso]:
			coordinate = Vector2(10, 2)
		[Animal.Type.Crocodile, BodyPart.Head]:
			coordinate = Vector2(11, 2)
	return coordinate

func getCardSpriteCoordinates() -> Vector2:
	var coordinate = Vector2(-1, -1)
	match [animal.rarity]:
		[Animal.Rarity.Common]:
			coordinate = Vector2(0, 0)
		[Animal.Rarity.Rare]:
			coordinate = Vector2(1, 0)
		[Animal.Rarity.Epic]:
			coordinate = Vector2(2, 0)
	return coordinate

func getBodyPartSelectorLayer() -> int:
	var layer = 0
	match [body_part]:
		[BodyPart.Lower]:
			layer = CollisionConsts.LOWER_SELECTOR
		[BodyPart.Torso]:
			layer = CollisionConsts.TORSO_SELECTOR
		[BodyPart.Head]:
			layer = CollisionConsts.HEAD_SELECTOR
	return layer

func getBodyPartDropAreaMask() -> int:
	var mask = 0
	match [body_part]:
		[BodyPart.Lower]:
			mask = CollisionConsts.LOWER_DROP_AREA
		[BodyPart.Torso]:
			mask = CollisionConsts.TORSO_DROP_AREA
		[BodyPart.Head]:
			mask = CollisionConsts.HEAD_DROP_AREA
	return mask
