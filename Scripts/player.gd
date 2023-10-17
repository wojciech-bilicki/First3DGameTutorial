extends RigidBody3D

class_name Player

@export var sync_position_node: Node3D
@export var camera_z_offset = 5

var speed = 70
var vertical_speed_increment = .2
var horizontal_speed_increment = .1

const JUMP_FORCE = 6

var input: Vector3 = Vector3.ZERO

var can_jump = true


func _process(delta):
	sync_position_node.position = Vector3(position.x, sync_position_node.position.y, position.z - camera_z_offset)

func _physics_process(delta):
	if input.z != 0:
		linear_velocity.z = lerpf(linear_velocity.z, speed,  sign(input.z)* vertical_speed_increment * delta)
	if input.x != 0:
		linear_velocity.x = lerpf(linear_velocity.x, speed, sign(input.x) * horizontal_speed_increment * delta)

func _input(event):
	input = Vector3(Input.get_action_raw_strength("left") - Input.get_action_raw_strength("right"), 0, Input.get_action_raw_strength("forward") - Input.get_action_raw_strength("slow_down"))
	
	if Input.is_action_just_pressed("jump") and can_jump:
		apply_central_impulse(Vector3(0, JUMP_FORCE, 0))
		can_jump = false


	
func _on_body_entered(body):
	if body is Floor:
		can_jump = true
