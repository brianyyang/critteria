class_name Animal
extends Resource

enum Type {
	Cat, Frog, Beetle, Turtle,
	Capybara, Chimpanzee, Dolphin, Horse,
	Ostrich, Camel, Hippo, Crocodile
}

enum Rarity {
	Common,
	Rare,
	Epic
}

@export var animal_type: Type
@export var power: int
@export var speed: int
@export var endurance: int
@export var swim: int
@export var rarity: Rarity
