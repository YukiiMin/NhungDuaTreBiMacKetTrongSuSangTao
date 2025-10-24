extends Sprite2D

func _ready():
	# Lấy kích thước viewport (màn hình game)
	var viewport_size = get_viewport_rect().size
	
	# Lấy kích thước của texture
	var texture_size = texture.get_size()
	
	# Tính toán scale để tràn full màn hình
	var scale_x = viewport_size.x / texture_size.x
	var scale_y = viewport_size.y / texture_size.y
	
	# Sử dụng scale lớn hơn để đảm bảo tràn full màn hình
	var scale_factor = max(scale_x, scale_y)
	
	# Áp dụng scale
	scale = Vector2(scale_factor, scale_factor)
	
	# Căn giữa background
	position = viewport_size / 2
	centered = true
