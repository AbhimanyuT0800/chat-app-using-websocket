import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'websocket_channel_provider.g.dart';

// connect websocket
@riverpod
WebSocketChannel webSocketChannel(WebSocketChannelRef ref) {
  return IOWebSocketChannel.connect(
    'ws://echo.websocket.org/',
  );
}
