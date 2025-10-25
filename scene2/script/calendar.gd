extends Area2D

func _ready():
	# Kết nối signal khi click vào calendar
	input_event.connect(_on_input_event)
	
	# Kết nối signal khi chuột vào/ra vùng calendar
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_input_event(_viewport, event, _shape_idx):
	# Khi người chơi click vào calendar
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		show_calendar_popup()

func _on_mouse_entered():
	# Thay đổi con trỏ chuột khi di vào vùng calendar
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func _on_mouse_exited():
	# Trở về con trỏ mặc định khi di ra
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)

func show_calendar_popup():
	# Hiển thị popup calendar
	var popup = get_node("../UI/CalendarPopup")
	if popup:
		popup.visible = true
		
		# Kết nối nút đóng
		var close_button = popup.get_node("CloseButton")
		if close_button and not close_button.pressed.is_connected(_on_close_popup):
			close_button.pressed.connect(_on_close_popup)
		
		print("Hiển thị calendar!")

func _on_close_popup():
	# Đóng popup calendar
	var popup = get_node("../UI/CalendarPopup")
	if popup:
		popup.visible = false
	
	# Hiển thị panel sau khi đóng calendar
	var after_panel = get_node("../UI/AfterCalendarPanel")
	if after_panel:
		after_panel.visible = true
		# Tạo hiệu ứng fade in
		after_panel.modulate.a = 0
		var tween = create_tween()
		tween.set_ease(Tween.EASE_OUT)
		tween.set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(after_panel, "modulate:a", 1.0, 0.8)
	
	print("Đóng calendar - Hiển thị text tiếp theo!")
