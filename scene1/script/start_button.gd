extends Button

func _ready():
	# Kết nối signal khi button được nhấn
	pressed.connect(_on_pressed)

func _on_pressed():
	# Ẩn button khi được nhấn
	visible = false
	
	# Hiện panel hướng dẫn
	var tutorial_panel = get_node("../TutorialPanel")
	if tutorial_panel:
		tutorial_panel.visible = true
	
	print("Hiện hướng dẫn chơi game!")
