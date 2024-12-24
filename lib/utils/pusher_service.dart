import 'dart:convert';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class PusherService extends GetxService {
  late PusherChannelsFlutter pusher;
  final String apiKey = '';
  final String cluster = 'ap2';
  String currentReceiverID = '';

  Future<PusherService> init() async {
    pusher = PusherChannelsFlutter.getInstance();
    await pusher.init(
      apiKey: apiKey,
      cluster: cluster,
      useTLS: true,
      onConnectionStateChange: (String previousState, String currentState) {
        onConnectionStateChange(previousState, currentState);
      },
      onError: (String message, int? code, dynamic e) {
        onError(message, code, e);
      },
    );

    await pusher.connect();
    return this;
  }

  void onConnectionStateChange(String previousState, String currentState) {
    Logger().i("Connection state changed from $previousState to $currentState");
  }

  void onError(String message, int? code, dynamic e) {
    Logger().e("Error: $message, Code: $code, Exception: $e");
  }

  Future<void> subscribeToChannel(
      String channelName, void Function(PusherEvent) onEvent) async {
    await pusher.subscribe(
      channelName: channelName,
      onEvent: (dynamic event) async {
        try {
          if (event is PusherEvent) {
            Logger().i(
                'Event received: ${event.eventName} with data: ${event.data}');
            Map<String, dynamic> jsonData = jsonDecode(event.data);
            String body = jsonData['data']['body'];
            Logger().d(body);

            if (channelName == "ChannelName") {
              /// ALl logics here----
            }
          }
        } catch (e) {
          Logger().e(e.toString());
        }
      },
    );
  }

  Future<void> unsubscribeFromChannel(String channelName) async {
    await pusher.unsubscribe(channelName: channelName);
  }

  Future<void> disconnect() async {
    await pusher.disconnect();
  }
}
