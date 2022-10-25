#include "pch.h"
#include "BaseWindowsService.h"

BaseWindowsService::BaseWindowsService(PCWSTR pszServiceName, BOOL fCanStop, BOOL fCanShutdown, BOOL fCanPauseContinue):CServiceBase(pszServiceName, fCanStop, fCanShutdown, fCanPauseContinue, MSG_SVC_FAILURE, CATEGORY_SERVICE) {
}

BaseWindowsService::~BaseWindowsService()
{
}

void BaseWindowsService::OnStart(DWORD dwArgc, PWSTR* pszArgv)
{
}

void BaseWindowsService::OnStop()
{
}

void BaseWindowsService::Run()
{
}
