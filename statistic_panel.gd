extends Node2D

@onready var _count = $CountLabel
@onready var _highest = $HighestLabel
@onready var _lowest = $LowestLabel

func update(count, highest, lowest):
	_count.text = "Count: %d" % count
	_highest.text = "Highest: %.2f%%" % (highest * 100)
	_lowest.text = "Lowest: %.2f%%" % (lowest * 100)