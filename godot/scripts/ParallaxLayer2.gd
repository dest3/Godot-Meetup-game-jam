extends ParallaxLayer


@export var CLOUD_SPEED = -0.3

func _process(delta) -> void:
	self.motion_offset.x += CLOUD_SPEED
