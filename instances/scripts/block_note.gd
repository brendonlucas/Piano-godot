extends Area3D


const SPEED = 10
var timer_dell = Timer
var velocidade = 10

func _ready() -> void:
	$CollisionShape3D.disabled = true
	await get_tree().create_timer(0.2).timeout
	$CollisionShape3D.disabled = false
	set_color_block()
	
	var timer = Timer.new()
	timer.wait_time = 3
	timer.one_shot = true
	add_child(timer)
	timer.timeout.connect(queue_free)
	timer.start()

func _process(delta: float) -> void:
	#var direction := (transform.basis * Vector3(0, 0, 1)).normalized()
	#if direction:
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#move_and_slide()
	position.z += 0.65


func set_color_block():
	var mat = StandardMaterial3D.new()
	mat.albedo_color = Color(0.98, 0.008, 0.063, 1.0) # verde
	$MeshInstance3D.set_surface_override_material(0, mat)
	


func _on_body_entered(body: Node3D) -> void:
	body.play_note()
