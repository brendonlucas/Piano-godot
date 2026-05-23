extends Node3D

var nota = load("res://instances/colision_note_block.tscn")
var spw_nota = load("res://instances/base_spawn_note.tscn")

var MAPA_NOTASs = {
	48: preload("res://mp3_Notes/c3.mp3"),
	49: preload("res://mp3_Notes/c-3.mp3"),
	50: preload("res://mp3_Notes/d3.mp3"),
	51: preload("res://mp3_Notes/d-3.mp3"),
	52: preload("res://mp3_Notes/e3.mp3"),
	53: preload("res://mp3_Notes/f3.mp3"),
	54: preload("res://mp3_Notes/f-3.mp3"),
	55: preload("res://mp3_Notes/g3.mp3"),
	56: preload("res://mp3_Notes/g-3.mp3"),
	57: preload("res://mp3_Notes/a3.mp3"),
	58: preload("res://mp3_Notes/a-3.mp3"),
	59: preload("res://mp3_Notes/b3.mp3"),

	60: preload("res://mp3_Notes/c4.mp3"),
	61: preload("res://mp3_Notes/c-4.mp3"),
	62: preload("res://mp3_Notes/d4.mp3"),
	63: preload("res://mp3_Notes/d-4.mp3"),
	64: preload("res://mp3_Notes/e4.mp3"),
	65: preload("res://mp3_Notes/f4.mp3"),
	66: preload("res://mp3_Notes/f-4.mp3"),
	67: preload("res://mp3_Notes/g4.mp3"),
	68: preload("res://mp3_Notes/g-4.mp3"),
	69: preload("res://mp3_Notes/a4.mp3"),
	70: preload("res://mp3_Notes/a-4.mp3"),
	71: preload("res://mp3_Notes/b4.mp3"),

	72: preload("res://mp3_Notes/c5.mp3"),
	73: preload("res://mp3_Notes/c-5.mp3"),
	74: preload("res://mp3_Notes/d5.mp3"),
	75: preload("res://mp3_Notes/d-5.mp3"),
	76: preload("res://mp3_Notes/e5.mp3"),
	77: preload("res://mp3_Notes/f5.mp3"),
	78: preload("res://mp3_Notes/f-5.mp3"),
	79: preload("res://mp3_Notes/g5.mp3"),
	80: preload("res://mp3_Notes/g-5.mp3"),
	81: preload("res://mp3_Notes/a5.mp3"),
	82: preload("res://mp3_Notes/a-5.mp3"),
	83: preload("res://mp3_Notes/b5.mp3"),

	84: preload("res://mp3_Notes/c6.mp3")
}
var MAPA_NOTAS = {
	21: preload("res://piano-mp3_89/A0.mp3"),
	22: preload("res://piano-mp3_89/Bb0.mp3"),
	23: preload("res://piano-mp3_89/B0.mp3"),

	24: preload("res://piano-mp3_89/C1.mp3"),
	25: preload("res://piano-mp3_89/Db1.mp3"),
	26: preload("res://piano-mp3_89/D1.mp3"),
	27: preload("res://piano-mp3_89/Eb1.mp3"),
	28: preload("res://piano-mp3_89/E1.mp3"),
	29: preload("res://piano-mp3_89/F1.mp3"),
	30: preload("res://piano-mp3_89/Gb1.mp3"),
	31: preload("res://piano-mp3_89/G1.mp3"),
	32: preload("res://piano-mp3_89/Ab1.mp3"),
	33: preload("res://piano-mp3_89/A1.mp3"),
	34: preload("res://piano-mp3_89/Bb1.mp3"),
	35: preload("res://piano-mp3_89/B1.mp3"),

	36: preload("res://piano-mp3_89/C2.mp3"),
	37: preload("res://piano-mp3_89/Db2.mp3"),
	38: preload("res://piano-mp3_89/D2.mp3"),
	39: preload("res://piano-mp3_89/Eb2.mp3"),
	40: preload("res://piano-mp3_89/E2.mp3"),
	41: preload("res://piano-mp3_89/F2.mp3"),
	42: preload("res://piano-mp3_89/Gb2.mp3"),
	43: preload("res://piano-mp3_89/G2.mp3"),
	44: preload("res://piano-mp3_89/Ab2.mp3"),
	45: preload("res://piano-mp3_89/A2.mp3"),
	46: preload("res://piano-mp3_89/Bb2.mp3"),
	47: preload("res://piano-mp3_89/B2.mp3"),

	48: preload("res://piano-mp3_89/C3.mp3"),
	49: preload("res://piano-mp3_89/Db3.mp3"),
	50: preload("res://piano-mp3_89/D3.mp3"),
	51: preload("res://piano-mp3_89/Eb3.mp3"),
	52: preload("res://piano-mp3_89/E3.mp3"),
	53: preload("res://piano-mp3_89/F3.mp3"),
	54: preload("res://piano-mp3_89/Gb3.mp3"),
	55: preload("res://piano-mp3_89/G3.mp3"),
	56: preload("res://piano-mp3_89/Ab3.mp3"),
	57: preload("res://piano-mp3_89/A3.mp3"),
	58: preload("res://piano-mp3_89/Bb3.mp3"),
	59: preload("res://piano-mp3_89/B3.mp3"),

	60: preload("res://piano-mp3_89/C4.mp3"),
	61: preload("res://piano-mp3_89/Db4.mp3"),
	62: preload("res://piano-mp3_89/D4.mp3"),
	63: preload("res://piano-mp3_89/Eb4.mp3"),
	64: preload("res://piano-mp3_89/E4.mp3"),
	65: preload("res://piano-mp3_89/F4.mp3"),
	66: preload("res://piano-mp3_89/Gb4.mp3"),
	67: preload("res://piano-mp3_89/G4.mp3"),
	68: preload("res://piano-mp3_89/Ab4.mp3"),
	69: preload("res://piano-mp3_89/A4.mp3"),
	70: preload("res://piano-mp3_89/Bb4.mp3"),
	71: preload("res://piano-mp3_89/B4.mp3"),

	72: preload("res://piano-mp3_89/C5.mp3"),
	73: preload("res://piano-mp3_89/Db5.mp3"),
	74: preload("res://piano-mp3_89/D5.mp3"),
	75: preload("res://piano-mp3_89/Eb5.mp3"),
	76: preload("res://piano-mp3_89/E5.mp3"),
	77: preload("res://piano-mp3_89/F5.mp3"),
	78: preload("res://piano-mp3_89/Gb5.mp3"),
	79: preload("res://piano-mp3_89/G5.mp3"),
	80: preload("res://piano-mp3_89/Ab5.mp3"),
	81: preload("res://piano-mp3_89/A5.mp3"),
	82: preload("res://piano-mp3_89/Bb5.mp3"),
	83: preload("res://piano-mp3_89/B5.mp3"),

	84: preload("res://piano-mp3_89/C6.mp3"),
	85: preload("res://piano-mp3_89/Db6.mp3"),
	86: preload("res://piano-mp3_89/D6.mp3"),
	87: preload("res://piano-mp3_89/Eb6.mp3"),
	88: preload("res://piano-mp3_89/E6.mp3"),
	89: preload("res://piano-mp3_89/F6.mp3"),
	90: preload("res://piano-mp3_89/Gb6.mp3"),
	91: preload("res://piano-mp3_89/G6.mp3"),
	92: preload("res://piano-mp3_89/Ab6.mp3"),
	93: preload("res://piano-mp3_89/A6.mp3"),
	94: preload("res://piano-mp3_89/Bb6.mp3"),
	95: preload("res://piano-mp3_89/B6.mp3"),

	96: preload("res://piano-mp3_89/C7.mp3"),
	97: preload("res://piano-mp3_89/Db7.mp3"),
	98: preload("res://piano-mp3_89/D7.mp3"),
	99: preload("res://piano-mp3_89/Eb7.mp3"),
	100: preload("res://piano-mp3_89/E7.mp3"),
	101: preload("res://piano-mp3_89/F7.mp3"),
	102: preload("res://piano-mp3_89/Gb7.mp3")
}

var dados = []
var tempo_atual = 0.0
var index = 0
var cena_bloco = preload("res://instances/block_note.tscn")
func _ready() -> void:
	var file = FileAccess.open("res://musics/ThroughthefireandFlame.mid.json", FileAccess.READ)
	dados = JSON.parse_string(file.get_as_text())
	
	
	
	instance_spawns_blocks()
	instance_notes_blocks()

var start_musica = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		start_musica = true
	if start_musica:
		tempo_atual += delta
		while index < dados.size() and dados[index]["tempo"] <= tempo_atual:
			spawn_nota(dados[index], dados[index]["nota_midi"])
			index += 1
		
func spawn_nota(nota_data, nota_info):
	var obj = cena_bloco.instantiate()
	add_child(obj)
	var pos_nota = get_node("spw"+str(int(nota_info)))
	obj.position = pos_nota.global_position
	
func instance_spawns_blocks():
	for x in range(89): #37
		var obj = spw_nota.instantiate()
		obj.name = "spw" + str(x+20) # 47
		add_child(obj)
		obj.position = Vector3(x-40, 0, -40)

func instance_notes_blocks():
	for x in range(82,0,-1): #37
		print(x+20)
		var obj = nota.instantiate()
		obj.set_audio(MAPA_NOTAS[x+20])#47
		
		add_child(obj)
		obj.position = Vector3(x-40, 0, 0)
		

		
