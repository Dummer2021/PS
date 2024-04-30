@SET INSTALL_DIR=%~dp0
@SET WWWROOT=%systemdrive%\inetpub\wwwroot

@SET ReportsCORE_DIR=%WWWROOT%\**.**.Core
@SET ReportsCORE_ServiceName=***-***

%INSTALL_DIR%dotnet-hosting-6.0.3-win.exe /install /quiet

iisreset /STOP
SC STOP %***CORE_ServiceName%

@REM Сохраняем appsettings в котором строка подключения
move %***CORE_DIR%\appsettings.json %WWWROOT%
DEL /q /s "%***CORE_DIR%"
rmdir /q /s "%***CORE_DIR%"
DEL /q /s "%WWWROOT%\ReportsViewer"
rmdir /q /s "%WWWROOT%\ReportsViewer"
DEL /q /s "%WWWROOT%\*WebApi\*Ai.Reports"
rmdir /q /s "%WWWROOT%\*WebApi\*Api.Reports"

@REM Распаковать: Reports.zip, Web.zip, WebApi.zip
@REM В директорию: С:\inetpub\wwwroot
@REM Структура каталогов в директории С:\inetpub\wwwroot должна быть такой:
@REM С:\inetpub\wwwroot\**.Reports.Core
@REM С:\inetpub\wwwroot\**ReportsViewer
@REM С:\inetpub\wwwroot\**Web
@REM С:\inetpub\wwwroot\**WebApi

MD %WWWROOT%\ReportsViewer\Templates
icacls %WWWROOT%\ReportsViewer\Templates /grant BUILTIN\IIS_IUSRS:(OI)(CI)(IO)(F)
icacls %WWWROOT%\ReportsViewer\Templates /grant BUILTIN\IIS_IUSRS:(F)

move %WWWROOT%\appsettings.json %ReportsCORE_DIR%
sc delete "**-ReportsCore"
sc create "**-ReportsCore" binpath=%ReportsCORE_DIR%\*TM.*.Reports.Executor.Service.exe
pause

