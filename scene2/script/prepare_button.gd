extends Button

func _ready():
	# Kết nối signal khi button được nhấn
	pressed.connect(_on_pressed)

func _on_pressed():
	print("Chuẩn bị đi họp - Chuyển sang Scene 3!")
	
	# Delay ngắn cho mượt
	await get_tree().create_timer(0.3).timeout
	
	# Chuyển sang Scene 3
	get_tree().change_scene_to_file("res://scene3/Scene_3.tscn")
