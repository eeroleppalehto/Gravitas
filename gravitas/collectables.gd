class_name Collectables
## Class implementation for collectables ingame
##
## To use create object of this class:
## [codeblock lang=gdscript]
## var collectables = Collectables.new(0, 0, false)
## [/codeblock]

var items1: int
var items2: int
var hasItem3: bool

## Constructor method for Collectables class
## items1Arg = number of item1 player holds
## items2Arg = number of item2 player holds
## hasItem3Arg = boolean value for whether player holds item3
func _init(items1Arg: int, items2Arg: int, hasItem3Arg: bool) -> void:
	items1 = items1Arg
	items2 = items2Arg
	hasItem3 = hasItem3Arg
