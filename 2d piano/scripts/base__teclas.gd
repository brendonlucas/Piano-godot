extends Control

var start_musica = false
var dados = []
var tempo_atual = 0.0
var index = 0
var cena_bloco = preload("res://2d piano/note_block.tscn")

func _ready() -> void:
	pass

func set_music(type):
	if type == "music":
		var file = FileAccess.open(GameState.current_music, FileAccess.READ)
		dados = JSON.parse_string(file.get_as_text())
		tempo_atual = 0
		start_musica = false
	else:
		GameState.current_music = "none"

func play_music():
	if start_musica == false:
		set_music("music")
		start_musica = true
		$ProgressBar.max_value = dados[dados.size()-1]["tempo"]
		
func stop_music():
	#$ProgressBar.max_value = dados[dados.size()-1]["tempo"]
	start_musica = false
	tempo_atual =  0.0
	index = 0
	set_music("none")
	
func _process(delta: float) -> void:
	
	if start_musica:
		tempo_atual += delta
		$ProgressBar.value = tempo_atual
		while index < dados.size() and dados[index]["tempo"] <= tempo_atual:
			spawn_nota(dados[index], dados[index]["nota_midi"])
			index += 1
		if index >= dados.size():
			start_musica = false
		$Timer_musica.text = str(formatar_tempo(tempo_atual)) + " - " + str(formatar_tempo(dados[dados.size()-1]["tempo"]))
func spawn_nota(nota_data, nota_info):
	var obj = cena_bloco.instantiate()
	add_child(obj)
	var pos_nota = get_node("area_spawn/spw"+str(int(nota_info)))
	obj.position = pos_nota.global_position
	
func play_note(nome_nota):
	var btn = get_node("keys/"+nome_nota)
	#btn.button_down.emit()
	btn.toggle_mode = true
	btn.button_pressed = true
	btn.button_down.emit()
	await get_tree().create_timer(0.1).timeout
	btn.button_pressed = false
	btn.toggle_mode = false
	btn.button_up.emit()
	
	#get_node("keys/"+nome_nota+"/AudioStreamPlayer2D").play()
	
	
func formatar_tempo(segundos):
	var min = int(segundos / 60)
	var sec = int(segundos) % 60
	return "%02d:%02d" % [min, sec]
	
func _on_key_a0_button_down() -> void:
	$keys/key_A0/AudioStreamPlayer2D.play()


func _on_key_a_1_button_down() -> void:
	$keys/key_A1/AudioStreamPlayer2D.play()


func _on_key_a_2_button_down() -> void:
	$keys/key_A2/AudioStreamPlayer2D.play()

func _on_key_a_3_button_down() -> void:
	$keys/key_A3/AudioStreamPlayer2D.play()
	
func _on_key_a_4_button_down() -> void:
	$keys/key_A4/AudioStreamPlayer2D.play()


func _on_key_a_5_button_down() -> void:
	$keys/key_A5/AudioStreamPlayer2D.play()


func _on_key_a_6_button_down() -> void:
	$keys/key_A6/AudioStreamPlayer2D.play()


func _on_key_a_7_button_down() -> void:
	$keys/key_A7/AudioStreamPlayer2D.play()


func _on_key_b_0_button_down() -> void:
	$keys/key_B0/AudioStreamPlayer2D.play()


func _on_key_b_1_button_down() -> void:
	$keys/key_B1/AudioStreamPlayer2D.play()


func _on_key_b_2_button_down() -> void:
	$keys/key_B2/AudioStreamPlayer2D.play()


func _on_key_b_3_button_down() -> void:
	$keys/key_B3/AudioStreamPlayer2D.play()


func _on_key_b_4_button_down() -> void:
	$keys/key_B4/AudioStreamPlayer2D.play()


func _on_key_b_5_button_down() -> void:
	$keys/key_B5/AudioStreamPlayer2D.play()


func _on_key_b_6_button_down() -> void:
	$keys/key_B6/AudioStreamPlayer2D.play()


func _on_key_b_7_button_down() -> void:
	$keys/key_B7/AudioStreamPlayer2D.play()


func _on_key_c_1_button_down() -> void:
	$keys/key_C1/AudioStreamPlayer2D.play()


func _on_key_c_2_button_down() -> void:
	$keys/key_C2/AudioStreamPlayer2D.play()


func _on_key_c_3_button_down() -> void:
	$keys/key_C3/AudioStreamPlayer2D.play()


func _on_key_c_4_button_down() -> void:
	$keys/key_C4/AudioStreamPlayer2D.play()


func _on_key_c_5_button_down() -> void:
	$keys/key_C5/AudioStreamPlayer2D.play()


func _on_key_c_6_button_down() -> void:
	$keys/key_C6/AudioStreamPlayer2D.play()


func _on_key_c_7_button_down() -> void:
	$keys/key_C7/AudioStreamPlayer2D.play()


func _on_key_c_8_button_down() -> void:
	$keys/key_C8/AudioStreamPlayer2D.play()


func _on_key_d_1_button_down() -> void:
	$keys/key_D1/AudioStreamPlayer2D.play()


func _on_key_d_2_button_down() -> void:
	$keys/key_D2/AudioStreamPlayer2D.play()


func _on_key_d_3_button_down() -> void:
	$keys/key_D3/AudioStreamPlayer2D.play()


func _on_key_d_4_button_down() -> void:
	$keys/key_D4/AudioStreamPlayer2D.play()


func _on_key_d_5_button_down() -> void:
	$keys/key_D5/AudioStreamPlayer2D.play()


func _on_key_d_6_button_down() -> void:
	$keys/key_D6/AudioStreamPlayer2D.play()


func _on_key_d_7_button_down() -> void:
	$keys/key_D7/AudioStreamPlayer2D.play()


func _on_key_e_1_button_down() -> void:
	$keys/key_E1/AudioStreamPlayer2D.play()


func _on_key_e_2_button_down() -> void:
	$keys/key_E2/AudioStreamPlayer2D.play()


func _on_key_e_3_button_down() -> void:
	$keys/key_E3/AudioStreamPlayer2D.play()


func _on_key_e_4_button_down() -> void:
	$keys/key_E4/AudioStreamPlayer2D.play()


func _on_key_e_5_button_down() -> void:
	$keys/key_E5/AudioStreamPlayer2D.play()


func _on_key_e_6_button_down() -> void:
	$keys/key_E6/AudioStreamPlayer2D.play()


func _on_key_e_7_button_down() -> void:
	$keys/key_E7/AudioStreamPlayer2D.play()


func _on_key_f_1_button_down() -> void:
	$keys/key_F1/AudioStreamPlayer2D.play()


func _on_key_f_2_button_down() -> void:
	$keys/key_F2/AudioStreamPlayer2D.play()


func _on_key_f_3_button_down() -> void:
	$keys/key_F3/AudioStreamPlayer2D.play()


func _on_key_f_4_button_down() -> void:
	$keys/key_F4/AudioStreamPlayer2D.play()


func _on_key_f_5_button_down() -> void:
	$keys/key_F5/AudioStreamPlayer2D.play()


func _on_key_f_6_button_down() -> void:
	$keys/key_F6/AudioStreamPlayer2D.play()


func _on_key_f_7_button_down() -> void:
	$keys/key_F7/AudioStreamPlayer2D.play()


func _on_key_g_1_button_down() -> void:
	$keys/key_G1/AudioStreamPlayer2D.play()


func _on_key_g_2_button_down() -> void:
	$keys/key_G2/AudioStreamPlayer2D.play()


func _on_key_g_3_button_down() -> void:
	$keys/key_G3/AudioStreamPlayer2D.play()


func _on_key_g_4_button_down() -> void:
	$keys/key_G4/AudioStreamPlayer2D.play()


func _on_key_g_5_button_down() -> void:
	$keys/key_G5/AudioStreamPlayer2D.play()


func _on_key_g_6_button_down() -> void:
	$keys/key_G6/AudioStreamPlayer2D.play()


func _on_key_g_7_button_down() -> void:
	$keys/key_G7/AudioStreamPlayer2D.play()


func _on_key_ab_1_button_down() -> void:
	$keys/key_Ab1/AudioStreamPlayer2D.play()


func _on_key_ab_2_button_down() -> void:
	$keys/key_Ab2/AudioStreamPlayer2D.play()


func _on_key_ab_3_button_down() -> void:
	$keys/key_Ab3/AudioStreamPlayer2D.play()


func _on_key_ab_4_button_down() -> void:
	$keys/key_Ab4/AudioStreamPlayer2D.play()


func _on_key_ab_5_button_down() -> void:
	$keys/key_Ab5/AudioStreamPlayer2D.play()


func _on_key_ab_6_button_down() -> void:
	$keys/key_Ab6/AudioStreamPlayer2D.play()


func _on_key_ab_7_button_down() -> void:
	$keys/key_Ab7/AudioStreamPlayer2D.play()

func _on_key_bb_0_button_down() -> void:
	$keys/key_Bb0/AudioStreamPlayer2D.play()


func _on_key_bb_1_button_down() -> void:
	$keys/key_Bb1/AudioStreamPlayer2D.play()


func _on_key_bb_2_button_down() -> void:
	$keys/key_Bb2/AudioStreamPlayer2D.play()


func _on_key_bb_3_button_down() -> void:
	$keys/key_Bb3/AudioStreamPlayer2D.play()


func _on_key_bb_4_button_down() -> void:
	$keys/key_Bb4/AudioStreamPlayer2D.play()


func _on_key_bb_5_button_down() -> void:
	$keys/key_Bb5/AudioStreamPlayer2D.play()


func _on_key_bb_6_button_down() -> void:
	$keys/key_Bb6/AudioStreamPlayer2D.play()


func _on_key_bb_7_button_down() -> void:
	$keys/key_Bb7/AudioStreamPlayer2D.play()


func _on_key_db_1_button_down() -> void:
	$keys/key_Db1/AudioStreamPlayer2D.play()


func _on_key_db_2_button_down() -> void:
	$keys/key_Db2/AudioStreamPlayer2D.play()


func _on_key_db_3_button_down() -> void:
	$keys/key_Db3/AudioStreamPlayer2D.play()


func _on_key_db_4_button_down() -> void:
	$keys/key_Db4/AudioStreamPlayer2D.play()


func _on_key_db_5_button_down() -> void:
	$keys/key_Db5/AudioStreamPlayer2D.play()


func _on_key_db_6_button_down() -> void:
	$keys/key_Db6/AudioStreamPlayer2D.play()


func _on_key_db_7_button_down() -> void:
	$keys/key_Db7/AudioStreamPlayer2D.play()


func _on_key_db_8_button_down() -> void:
	$keys/key_Db8/AudioStreamPlayer2D.play()


func _on_key_eb_1_button_down() -> void:
	$keys/key_Eb1/AudioStreamPlayer2D.play()


func _on_key_eb_2_button_down() -> void:
	$keys/key_Eb2/AudioStreamPlayer2D.play()


func _on_key_eb_3_button_down() -> void:
	$keys/key_Eb3/AudioStreamPlayer2D.play()


func _on_key_eb_4_button_down() -> void:
	$keys/key_Eb4/AudioStreamPlayer2D.play()


func _on_key_eb_5_button_down() -> void:
	$keys/key_Eb5/AudioStreamPlayer2D.play()


func _on_key_eb_6_button_down() -> void:
	$keys/key_Eb6/AudioStreamPlayer2D.play()


func _on_key_eb_7_button_down() -> void:
	$keys/key_Eb7/AudioStreamPlayer2D.play()


func _on_key_gb_1_button_down() -> void:
	$keys/key_Gb1/AudioStreamPlayer2D.play()


func _on_key_gb_2_button_down() -> void:
	$keys/key_Gb2/AudioStreamPlayer2D.play()


func _on_key_gb_3_button_down() -> void:
	$keys/key_Gb3/AudioStreamPlayer2D.play()


func _on_key_gb_4_button_down() -> void:
	$keys/key_Gb4/AudioStreamPlayer2D.play()


func _on_key_gb_5_button_down() -> void:
	$keys/key_Gb5/AudioStreamPlayer2D.play()


func _on_key_gb_6_button_down() -> void:
	$keys/key_Gb6/AudioStreamPlayer2D.play()


func _on_key_gb_7_button_down() -> void:
	$keys/key_Gb7/AudioStreamPlayer2D.play()
