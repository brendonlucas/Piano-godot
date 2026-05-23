extends StaticBody3D



func _ready() -> void:
	pass



func _process(delta: float) -> void:
	pass

func set_audio(loc_audio):
	$AudioStreamPlayer3D.stream = loc_audio
	
	
func play_note():
	$AudioStreamPlayer3D.play()
	
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("notas"):
		body.name
		print("tcou  " + body.name)
		
