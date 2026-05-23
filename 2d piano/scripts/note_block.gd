extends Area2D

var cena_bloco = preload("res://2d piano/explosion.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_color_block()
	#var timer = Timer.new()
	#timer.wait_time = 7
	#timer.one_shot = true
	#add_child(timer)
	#timer.start()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var direction := (transform.basis * Vector3(0, 0, 1)).normalized()
	#if direction:
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#move_and_slide()
	position.y += 2 #0.65


func set_color_block():
	$ColorRect.color = Color(0.0, 2.942, 2.945, 1.0)
	


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("key_piano"):
		var name_nota = area.get_parent().name
		get_tree().current_scene.play_note(name_nota)
		var obj = cena_bloco.instantiate()
		get_parent().add_child(obj)
		obj.position = global_position
		queue_free()
