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

## Method to collect item1
func collect_item1(amount: int) -> void:
	items1 += amount
	emit_signal("collect_item1", amount)
	print("Collected Item 1: ", amount)

## Method to collect item2
func collect_item2(amount: int) -> void:
	items2 += amount
	emit_signal("collect_item2", amount)
	print("Collected Item 2: ", amount)

## Method to toggle item3
func toggle_item3() -> void:
	hasItem3 = not hasItem3
	emit_signal("toggle_item3_signal", hasItem3)
	

## Method to display current inventory
func display_inventory() -> void:
	print("Item 1: ", items1)
	print("Item 2: ", items2)
	print("Has Item 3: ", hasItem3)
	
## Method to reset inventory
func reset_inventory() -> void:
	items1 = 0
	items2 = 0
	hasItem3 = false
	
