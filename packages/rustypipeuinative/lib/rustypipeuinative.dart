import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ffi.dart' as ffi;

class Rustypipeuinative {
  // static const MethodChannel _channel = MethodChannel('rustypipeuinative');

  // static Future<String?> get platformVersion async {
  //   final String? version = await _channel.invokeMethod('getPlatformVersion');
  //   return version;
  // }
  static int getPort() {
    return ffi.get_port();
  }

  static startServer(int port) {
    compute(runserver, port);
  }
}

int runserver(int port) {
  ffi.run_server(port);
  return 0;
}
