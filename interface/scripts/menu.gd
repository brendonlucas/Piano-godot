extends Control

@onready var lista = $music_list/ColorRect/ItemList
var current_musica = ""
var pasta_json = "res://musics/"
var arquivos = []
var stats_hide = false
var btn_start_disable = true

func _ready():
	$menu_btns/BTN_start.disabled = true
	carregar_lista()
	lista.item_clicked.connect(_on_item_clicked)
	


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Esc"):
		if stats_hide:
			$AnimationPlayer.play("fade_in")
			stats_hide = false
		else:
			$AnimationPlayer.play("fade_out")
			stats_hide = true
			
	
		
func carregar_lista():
	lista.clear()
	arquivos.clear()
	var dir = DirAccess.open(pasta_json)
	if dir:
		dir.list_dir_begin()
		var file = dir.get_next()
		while file != "":
			if !dir.current_is_dir() and file.ends_with(".json"):
				arquivos.append(file)
				lista.add_item(file.get_basename())
			file = dir.get_next()
		dir.list_dir_end()


func _on_item_clicked(index, at_position, mouse_button):
	current_musica = pasta_json + arquivos[index]
	GameState.current_music = current_musica
	$menu_btns/BTN_start.disabled = false

var state_list_menu = "hide"
func _on_btn_list_button_down() -> void:
	if state_list_menu == "hide":
		state_list_menu = "show"
		$music_list/AnimationPlayer.play("fade_in")
	else:
		state_list_menu = "hide"
		$music_list/AnimationPlayer.play("fade_out")


func _on_btn_start_button_down() -> void:
	GameState.play_music()
	$menu_btns/BTN_start.disabled = true
	stats_hide = true
	$AnimationPlayer.play("fade_out")
	
	


func _on_btn_stop_button_down() -> void:
	GameState.stop_music()
	$menu_btns/BTN_start.disabled = true
