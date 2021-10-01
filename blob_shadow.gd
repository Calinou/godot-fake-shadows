extends Spatial

# Some bias to avoid Z-fighting.
const BIAS = 0.01

# Use 4 RayCasts to ensure the shadow is visible as often as possible.
onready var raycast_nw := $RayCastNW as RayCast
onready var raycast_ne := $RayCastNE as RayCast
onready var raycast_sw := $RayCastSW as RayCast
onready var raycast_se := $RayCastSE as RayCast
onready var mesh_instance := $MeshInstance as MeshInstance


func _ready() -> void:
	mesh_instance.set_as_toplevel(true)


func _physics_process(_delta: float) -> void:
	if raycast_nw.is_colliding() or raycast_ne.is_colliding() or raycast_sw.is_colliding() or raycast_se.is_colliding():
		visible = true
		
		var collision_points := [raycast_nw.get_collision_point(), raycast_ne.get_collision_point(), raycast_sw.get_collision_point(), raycast_se.get_collision_point()]
		var average: Vector3 = (raycast_nw.global_transform.origin + raycast_ne.global_transform.origin + raycast_sw.global_transform.origin + raycast_se.global_transform.origin) * 0.25
		
		# Keep the highest Y coordinate of all the RayCasts to ensure the shadow is visible as often as possible.
		var highest_y: float = [collision_points[0].y, collision_points[1].y, collision_points[2].y, collision_points[3].y].max()
		
		mesh_instance.global_transform.origin = Vector3(average.x, highest_y, average.z) + Vector3(0, BIAS, 0)
		# TODO: Adjust rotation based on collision normal.
	else:
		visible = false
