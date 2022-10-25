#pragma once
#include "ServiceBase.h"
#include "ServiceInstaller.h"
//
// MessageId: MSG_SHUTDOWN
//
// MessageText:
//
// Shutdown
//
#define MSG_SVC_FAILURE                  ((DWORD)0xC000000DL)

#define CATEGORY_SERVICE                 ((DWORD)0x00000001L)



class BaseWindowsService :
    public CServiceBase
{


public:
    BaseWindowsService(PCWSTR pszServiceName,
        BOOL fCanStop = TRUE,
        BOOL fCanShutdown = TRUE,
        BOOL fCanPauseContinue = FALSE
    );
    ~BaseWindowsService();

    virtual void OnStart(DWORD dwArgc, PWSTR* pszArgv);

    virtual void OnStop();

    //static DWORD __stdcall  ServiceRunner(void* self);

    void Run();

private:
    BOOL m_bIsStopping;
    HANDLE m_hHasStoppedEvent;
    std::wstring m_wstrParam;
};
