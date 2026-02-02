import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketManager {
  late WebSocketChannel _channel;
  late WebSocket _webSocket;
  String receivedMessage = "";
  int yourJsonKeyValue = 0;

  Future<void> connectWebSocket() async {
    List<String> urls = ['your-websocket-url', 'your-websocket-url'];
    for (var url in urls) {
      try {
        _webSocket = await WebSocket.connect(url);
        _channel = IOWebSocketChannel(_webSocket);

        _channel.stream.listen(
          (message) {
            _parseReceivedMessage(message);
            receivedMessage = message;
          },
          onError: (err) {
            connectWebSocket();
          },
          onDone: () {
            connectWebSocket();
          },
          cancelOnError: true,
        );
        Logger().i('WebSocket connection established in: $url');
      } catch (e) {
        connectWebSocket();
        Logger().e('WebSocket connection failed: $e');
      }
    }
  }

  void _parseReceivedMessage(String message) {
    Logger().d('Received message: $message');
    final Map<String, dynamic> data = jsonDecode(message);
    if (data.containsKey('json_key')) {
      yourJsonKeyValue = data['json_key'];
      Logger().d(yourJsonKeyValue);
    }
  }

  void sendMessage(String message) {
    if (_webSocket.readyState == WebSocket.open) {
      _webSocket.add(message);
    } else {
      Logger().e('WebSocket is not open.');
    }
  }

  void closeWebSocket() {
    _channel.sink.close();
    Logger().i("WebSocket connection closed!");
  }
}
