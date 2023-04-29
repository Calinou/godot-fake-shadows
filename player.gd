extends RigidBody

const MOVE_SPEED = 0.2
const JUMP_SPEED = 0.2


func _process(delta: float):
	var motion := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	apply_central_impulse(Vector3(motion.x, 0, motion.y) * MOVE_SPEED)

	if Input.is_action_pressed("jump"):
		apply_central_impulse(Vector3(0, JUMP_SPEED, 0))
