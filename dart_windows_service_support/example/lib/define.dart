import 'dart:io';

import 'package:path/path.dart';

/// WindowsServiceDLL64 is x64
/// WindowsServiceDLL is x86
final dllPath = normalize(join(dirname(Platform.script.toFilePath()), "../../../dll/WindowsServiceDLL64.dll"));
const serviceName = "dart_test_service";
