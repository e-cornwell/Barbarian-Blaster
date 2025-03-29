extends Camera3D

@onready var ray_cast_3d: RayCast3D = $RayCast3D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	#Following will extend the ray to the shortest distance by default, had to multiply by 100.0 to reach the floor of the game but distance could vary.
	ray_cast_3d.target_position = project_local_ray_normal(mouse_position) * 100.0
	ray_cast_3d.force_raycast_update()
	printt(ray_cast_3d.get_collider(), ray_cast_3d.get_collision_point())
