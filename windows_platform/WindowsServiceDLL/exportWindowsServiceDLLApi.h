#pragma once
    
#include <winsmcrd.h>
#include <minwindef.h>

extern "C" __declspec(dllexport) void DartInstallService(PCWSTR pszServiceName,
    PCWSTR pszDisplayName,
    PCWSTR pszDescription,
    PCWSTR pszParams,
    DWORD dwStartType,
    PCWSTR pszDependencies,
    PCWSTR pszAccount,
    PCWSTR pszPassword,
    PCWSTR serviceCallPath,
    BOOL bRegisterWithEventLog,
    DWORD dwNumMessageCategories,
    PCWSTR pszMessageResourceFilePath
);

extern "C" __declspec(dllexport) void DartConnectService(
    PCWSTR  pszServiceName
);


extern "C" __declspec(dllexport) void DartUninstallService(PCWSTR pszServiceName);