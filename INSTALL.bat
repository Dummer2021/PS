@SET INSTALL_DIR=%~dp0
@SET WWWROOT=%systemdrive%\inetpub\wwwroot

@SET ReportsCORE_DIR=%WWWROOT%\**.**.Core
@SET ReportsCORE_ServiceName=***-***

%INSTALL_DIR%dotnet-hosting-6.0.3-win.exe /install /quiet

iisreset /STOP
SC STOP %***CORE_ServiceName%

@REM ��������� appsettings � ������� ������ �����������
move %***CORE_DIR%\appsettings.json %WWWROOT%
DEL /q /s "%***CORE_DIR%"
rmdir /q /s "%***CORE_DIR%"
DEL /q /s "%WWWROOT%\ReportsViewer"
rmdir /q /s "%WWWROOT%\ReportsViewer"
DEL /q /s "%WWWROOT%\*WebApi\*Ai.Reports"
rmdir /q /s "%WWWROOT%\*WebApi\*Api.Reports"

@REM �����������: Reports.zip, Web.zip, WebApi.zip
@REM � ����������: �:\inetpub\wwwroot
@REM ��������� ��������� � ���������� �:\inetpub\wwwroot ������ ���� �����:
@REM �:\inetpub\wwwroot\**.Reports.Core
@REM �:\inetpub\wwwroot\**ReportsViewer
@REM �:\inetpub\wwwroot\**Web
@REM �:\inetpub\wwwroot\**WebApi

MD %WWWROOT%\ReportsViewer\Templates
icacls %WWWROOT%\ReportsViewer\Templates /grant BUILTIN\IIS_IUSRS:(OI)(CI)(IO)(F)
icacls %WWWROOT%\ReportsViewer\Templates /grant BUILTIN\IIS_IUSRS:(F)

move %WWWROOT%\appsettings.json %ReportsCORE_DIR%
sc delete "**-ReportsCore"
sc create "**-ReportsCore" binpath=%ReportsCORE_DIR%\*TM.*.Reports.Executor.Service.exe
pause

