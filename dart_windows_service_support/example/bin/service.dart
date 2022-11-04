import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';

import 'package:ffi/ffi.dart';
import 'package:dart_windows_service_support/src/load_lib.dart';

import 'package:example/define.dart';

void main(List<String> args) async {
  final dartConnectServiceDLL = DartConnectServiceDLL(dllPath);
  await Isolate.spawn(run, 'message');
  dartConnectServiceDLL.dartConnectService(serviceName.toNativeUtf16().cast<Uint16>());
}

void run(String message) {
  Timer.periodic(Duration(seconds: 1), (timer) async {
    final f = File("d:/a.txt");
    await f.create();
    await f.writeAsString("${await f.readAsString()}1");
  });
}
