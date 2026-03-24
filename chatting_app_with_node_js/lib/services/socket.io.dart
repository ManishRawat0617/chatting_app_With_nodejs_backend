import 'dart:developer';

import 'package:socket_io_client/socket_io_client.dart';

class SocketService {
  Socket? socket;

  void connect(String user_id, String websocket) {
    socket = io(websocket, {
      'transports': ['websocket'],
      // 'autoConnect': false,
      "query": {"userId": user_id}
    });

    try {
      socket?.connect();
    } catch (e) {
      log("Socket connection failed: $e");
    }

    // Connection successful
    socket?.onConnect((_) {
      print('✅ Connected to Socket.io Server');
    });

    // Listen for messages from the server
    socket!.on('message', (data) {
      print('📩 New message from server: $data');
    });

    // Handle disconnection
    socket!.onDisconnect((_) {
      print('❌ Disconnected from Socket.io Server');
    });
  }

  void sendMessage(String message) {
    socket?.emit('message', message);
  }

  void disconnect() {
    socket?.disconnect();
  }
}
