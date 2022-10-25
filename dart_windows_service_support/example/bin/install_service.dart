import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:path/path.dart';
import 'package:dart_windows_service_support/src/load_lib.dart';

import '../lib/define.dart';

void main(List<String> args) {
  final dartConnectServiceDLL = DartConnectServiceDLL(dllPath);
  final servicePath = join(Directory.current.path, "service.exe");

  dartConnectServiceDLL.dartInstallService(
    serviceName.toNativeUtf16().cast<Uint16>(),
    serviceName.toNativeUtf16().cast<Uint16>(),
    "this is a dart test service".toNativeUtf16().cast<Uint16>(),
    "".toNativeUtf16().cast<Uint16>(),
    0x2,
    "".toNativeUtf16().cast<Uint16>(),
    Pointer.fromAddress(0),
    Pointer.fromAddress(0),

    /// path
    servicePath.toNativeUtf16().cast<Uint16>(),
    true,
    1,
    Pointer.fromAddress(0),
  );
}
