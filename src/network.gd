extends Control

# ---------- Setup server or client ----------
func setup_network(is_server: bool):
	var peer := ENetMultiplayerPeer.new()
	
	if is_server:
		peer.create_server(55556)
	else:
		peer.create_client("127.0.0.1", 55556)
	
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(peer_connected_callback)
	multiplayer.peer_packet.connect(received_message_callback)
	
	update_button_visual(is_server)

# ---------- Button signals ----------
func _on_start_server_button_pressed():
	setup_network(true)

func _on_start_client_button_pressed():
	setup_network(false)

func _on_send_message_button_pressed():
	var msg = "Hi from %d" % local_id()
	multiplayer.send_bytes(msg.to_utf8_buffer())

# ---------- Network signal callbacks ----------
func received_message_callback(id: int, packet: PackedByteArray):
	print(
		"peer %d: received msg from peer %d '%s'"
			% [local_id(), id, packet.get_string_from_utf8()]
	)

func peer_connected_callback(connected_peer_id: int):
	print('peer %d: received connection signal from (peer %d)' % [local_id(), connected_peer_id])

# ---------- Utils ----------
func local_id() -> int:
	return multiplayer.multiplayer_peer.get_unique_id()

func update_button_visual(is_server: bool):
	$StartServerButton.disabled = true
	$StartClientButton.disabled = true
	$SendMessageButton.disabled = false
	
	if is_server:
		$StartServerButton.modulate = Color.CYAN
	else:
		$StartClientButton.modulate = Color.LIGHT_CORAL
