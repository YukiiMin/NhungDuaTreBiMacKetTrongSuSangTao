extends Button

func _ready():
	# Kết nối signal khi button được nhấn
	pressed.connect(_on_pressed)

func _on_pressed():
	# Ẩn panel hướng dẫn khi nhấn OK
	var tutorial_panel = get_parent()
	if tutorial_panel:
		tutorial_panel.visible = false
	
	# Hiện thông báo "Hãy đánh thức nhân vật dậy"
	var notification = get_node("../../NotificationLabel")
	if notification:
		notification.visible = true
	
	# Bật âm thanh đồng hồ reo
	var clock = get_node("../../../Clock")
	if clock and clock.has_method("start_alarm"):
		clock.start_alarm()
	
	print("Đóng hướng dẫn - Hiện thông báo đánh thức nhân vật - Âm thanh đồng hồ reo!")
