# Dart Windows Service Support 🚀

`dart_windows_service_support` use `dart:ffi` access dll api

**need `WindowsServiceDLL.dll` support  download file for `https://github.com/au-top/dart_windows_service/releases` or clone git repository make project**

## Example

example global var

```dart
final dllPath = join(Directory.current.path, "../../../dll/WindowsServiceDLL64.dll");
const serviceName = "dartTestService";
```

`DartConnectServiceDLL.dartInstallService`  install service

```dart
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
    1,
    1,
    Pointer.fromAddress(0),
    1
  );
}
```

`DartConnectServiceDLL.dartConnectService`  connect service

```dart

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

```

`DartConnectServiceDLL.dartUninstallService`  uninstall service

```dart
void main(List<String> args) {
  final dartConnectServiceDLL = DartConnectServiceDLL(dllPath);
  dartConnectServiceDLL.dartUninstallService(serviceName.toNativeUtf16().cast<Uint16>());
}
```

See `dart_windows_service_support/example`
