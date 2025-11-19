import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketManager {
  final List<String> urls;
  final Logger _logger = Logger();

  WebSocket? _webSocket;
  WebSocketChannel? _channel;
  StreamSubscription? _subscription;

  RxString receivedMessage = "".obs;
  RxInt yourJsonKeyValue = 0.obs;
  RxBool isConnected = false.obs;

  bool _shouldReconnect = true;
  int _reconnectAttempts = 0;
  int _currentUrlIndex = 0;

  final Duration _baseReconnectDelay = const Duration(seconds: 2);
  final int _maxReconnectAttempts = 8;

  WebSocketManager({required this.urls});

  /// Start connection attempts (will try provided urls sequentially and reconnect on failures)
  Future<void> connectWebSocket() async {
    _shouldReconnect = true;
    _reconnectAttempts = 0;
    _currentUrlIndex = 0;
    _tryConnect();
  }

  Future<void> _tryConnect() async {
    if (!_shouldReconnect || urls.isEmpty) return;

    final url = urls[_currentUrlIndex % urls.length];
    try {
      await _closeExisting();
      _webSocket = await WebSocket.connect(url);
      _channel = IOWebSocketChannel(_webSocket!);

      isConnected.value = true;
      _reconnectAttempts = 0;
      _logger.i('WebSocket connected: $url');

      _subscription = _channel!.stream.listen(
        _handleIncoming,
        onError: (err) {
          _logger.e('WebSocket error: $err');
          isConnected.value = false;
          _scheduleReconnect();
        },
        onDone: () {
          _logger.i('WebSocket done for $url');
          isConnected.value = false;
          _scheduleReconnect();
        },
        cancelOnError: true,
      );
    } catch (e) {
      _logger.e('Connection to $url failed: $e');
      _scheduleReconnect();
      _currentUrlIndex++;
    }
  }

  void _handleIncoming(dynamic message) {
    final msgStr = message?.toString() ?? '';
    receivedMessage.value = msgStr;
    _logger.d('Received message: $msgStr');

    try {
      final data = jsonDecode(msgStr);
      if (data is Map<String, dynamic> && data.containsKey('json_key')) {
        final v = data['json_key'];
        if (v is int) {
          yourJsonKeyValue.value = v;
        } else if (v is String) {
          yourJsonKeyValue.value = int.tryParse(v) ?? yourJsonKeyValue.value;
        }
      }
    } catch (e) {
      _logger.w('Failed to decode JSON from message: $e');
    }
  }

  void _scheduleReconnect() {
    if (!_shouldReconnect) return;
    _reconnectAttempts++;
    if (_reconnectAttempts > _maxReconnectAttempts) {
      _logger.w(
          'Max reconnect attempts reached ($_maxReconnectAttempts). Giving up.');
      return;
    }

    final delay = Duration(
      seconds: _baseReconnectDelay.inSeconds * _reconnectAttempts,
    );
    _logger.i(
        'Scheduling reconnect in ${delay.inSeconds}s (attempt $_reconnectAttempts)');
    Future.delayed(delay, () {
      if (_shouldReconnect) _tryConnect();
    });
  }

  /// Send a text message if socket is open
  void sendMessage(String message) {
    if (_webSocket != null && _webSocket!.readyState == WebSocket.open) {
      _webSocket!.add(message);
    } else {
      _logger.e('WebSocket is not open. Unable to send message.');
    }
  }

  /// Close and stop reconnect attempts
  Future<void> closeWebSocket() async {
    _shouldReconnect = false;
    await _closeExisting();
    _logger.i('WebSocket connection closed and reconnect disabled.');
  }

  /// Close existing resources without changing reconnect flag
  Future<void> _closeExisting() async {
    try {
      await _subscription?.cancel();
    } catch (_) {}
    try {
      await _channel?.sink.close();
    } catch (_) {}
    try {
      await _webSocket?.close();
    } catch (_) {}
    _subscription = null;
    _channel = null;
    _webSocket = null;
    isConnected.value = false;
  }
}

// TODO: how to use ?
// call WebsocketManager.connectWebSocket()  into any getx controller onReady methode to initiate websocket
