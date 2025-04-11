extends Node
@export var player: CharacterBody2D

@export var camera_zone0: PhantomCamera2D
@export var camera_zone1: PhantomCamera2D
@export var camera_zone2: PhantomCamera2D
@export var camera_zone3: PhantomCamera2D
@export var camera_zone4: PhantomCamera2D
@export var camera_zone5: PhantomCamera2D

var current_camera_zone: int = 0

func update_current_zone(body, zone_a, zone_b):
	if body == player:
		match current_camera_zone:
			zone_a:
				current_camera_zone = zone_b
			zone_b:
				current_camera_zone= zone_a
		update_camera()

#setea la prioridad de todas las camaras en 0 y le da priorirdad 1 a la camara de la zona correspondiente
func update_camera():
	var cameras = [camera_zone0, camera_zone1, camera_zone2, camera_zone3,camera_zone4, camera_zone5]
	for camera in cameras:
		if camera != null:
			camera.priority = 0
	
	match current_camera_zone:
		0:
			camera_zone0.priority=1
		1:
			camera_zone1.priority=1
		2: 
			camera_zone2.priority=1
		3:
			camera_zone3.priority=1

func _on_zona_01_body_entered(body):
	update_current_zone(body, 0,1)
func _on_zona_12_body_entered(body):
	update_current_zone(body, 1,2)
func _on_zona_23_body_entered(body):
	update_current_zone(body, 2,3)
func _on_zona_34_body_entered(body):
	update_current_zone(body, 3,4)
