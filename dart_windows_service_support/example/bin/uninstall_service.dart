import 'dart:ffi';

import 'package:dart_windows_service_support/src/load_lib.dart';
import 'package:ffi/ffi.dart';

import '../lib/define.dart';

void main(List<String> args) {
  final dartConnectServiceDLL = DartConnectServiceDLL(dllPath);
  dartConnectServiceDLL.dartUninstallService(serviceName.toNativeUtf16().cast<Uint16>());
}
