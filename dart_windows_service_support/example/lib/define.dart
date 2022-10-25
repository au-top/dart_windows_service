import 'dart:io';

import 'package:path/path.dart';

final dllPath = normalize(join(dirname(Platform.script.toFilePath()), "../../../dll/WindowsServiceDLL.dll"));
const serviceName = "dartTestService";
