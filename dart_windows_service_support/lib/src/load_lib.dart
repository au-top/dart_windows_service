import 'dart:ffi' as ffi;

typedef PCWSTR = ffi.Pointer<ffi.Uint16>;
typedef DWORD = ffi.UnsignedLong;

typedef CDartInstallService = ffi.Void Function(
  PCWSTR pszServiceName,
  PCWSTR pszDisplayName,
  PCWSTR pszDescription,
  PCWSTR pszParams,
  DWORD dwStartType,
  PCWSTR pszDependencies,
  PCWSTR pszAccount,
  PCWSTR pszPassword,
  PCWSTR serviceCallPath,
  ffi.Bool bRegisterWithEventLog,
  DWORD dwNumMessageCategories,
  PCWSTR pszMessageResourceFilePath,
);

typedef DartInstallService = void Function(
  PCWSTR pszServiceName,
  PCWSTR pszDisplayName,
  PCWSTR pszDescription,
  PCWSTR pszParams,
  int dwStartType,
  PCWSTR pszDependencies,
  PCWSTR pszAccount,
  PCWSTR pszPassword,
  PCWSTR serviceCallPath,
  bool bRegisterWithEventLog,
  int dwNumMessageCategories,
  PCWSTR pszMessageResourceFilePath,
);

typedef CDartConnectService = ffi.Void Function(PCWSTR);
typedef DartConnectService = void Function(PCWSTR);

typedef CDartUninstallService = ffi.Void Function(PCWSTR);
typedef DartUninstallService = void Function(PCWSTR);

class DartConnectServiceDLL {
  late final ffi.DynamicLibrary dylib;
  late final DartInstallService dartInstallService = dylib.lookup<ffi.NativeFunction<CDartInstallService>>("DartInstallService").asFunction();
  late final DartConnectService dartConnectService = dylib.lookup<ffi.NativeFunction<CDartConnectService>>("DartConnectService").asFunction();
  late final DartUninstallService dartUninstallService = dylib.lookup<ffi.NativeFunction<CDartUninstallService>>("DartUninstallService").asFunction();

  DartConnectServiceDLL(String dllPath) {
    dylib = ffi.DynamicLibrary.open(dllPath);
  }
}
