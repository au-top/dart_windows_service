// dllmain.cpp : 定义 DLL 应用程序的入口点。
#include "pch.h"

#include "exportWindowsServiceDLLApi.h"
#include "BaseWindowsService.h"

extern "C" void DartInstallService(PCWSTR pszServiceName,
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
) {

    InstallService(pszServiceName,
        pszDisplayName,
        pszDescription,
        pszParams,
        dwStartType,
        pszDependencies,
        pszAccount,
        pszPassword,
        serviceCallPath,
        bRegisterWithEventLog,
        dwNumMessageCategories,
        pszMessageResourceFilePath
    );

}

extern "C" void DartConnectService(PCWSTR  pszServiceName) {
    BaseWindowsService service(pszServiceName);

    service.SetCommandLine(0, NULL);

    if (!CServiceBase::Run(service))
    {
        DWORD dwErr = GetLastError();

        wprintf(L"Service failed to run with error code: 0x%08lx\n", dwErr);

        //return dwErr;
    }
}


extern "C" void DartUninstallService(PCWSTR pszServiceName) {
    UninstallService(pszServiceName);
}