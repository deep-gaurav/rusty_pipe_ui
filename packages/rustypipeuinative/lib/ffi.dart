/// bindings for `rustypipeuinative`

import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart' as ffi;

// ignore_for_file: unused_import, camel_case_types, non_constant_identifier_names
final DynamicLibrary _dl = _open();
/// Reference to the Dynamic Library, it should be only used for low-level access
final DynamicLibrary dl = _dl;
DynamicLibrary _open() {
  if (Platform.isWindows) return DynamicLibrary.open('${File(Platform.resolvedExecutable).parent.path}/librustypipeuinative.dll');
  if (Platform.isLinux) return DynamicLibrary.open('${File(Platform.resolvedExecutable).parent.path}/lib/librustypipeuinative.so');
  if (Platform.isAndroid) return DynamicLibrary.open('librustypipeuinative.so');
  if (Platform.isIOS) return DynamicLibrary.executable();
  throw UnsupportedError('This platform is not supported.');
}

/// C function `get_port`.
int get_port() {
  return _get_port();
}
final _get_port_Dart _get_port = _dl.lookupFunction<_get_port_C, _get_port_Dart>('get_port');
typedef _get_port_C = Uint16 Function();
typedef _get_port_Dart = int Function();

/// C function `run_server`.
void run_server(
  int port,
) {
  _run_server(port);
}
final _run_server_Dart _run_server = _dl.lookupFunction<_run_server_C, _run_server_Dart>('run_server');
typedef _run_server_C = Void Function(
  Uint16 port,
);
typedef _run_server_Dart = void Function(
  int port,
);
