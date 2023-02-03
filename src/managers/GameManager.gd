extends Node

const LEFT_BORDER = 400;
const RIGHT_BORDER = 1520;
const TOP_BORDER = 200;
const BOTTOM_BORDER = 880;

var DRAGGING_OBJECT = false;

func _ready() -> void:
	randomize()
