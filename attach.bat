:: Automatically attach to a created container (first created container if multiple) ::
@ECHO OFF
:: Get last (least recent) container by ID; this will be the last container appearing in the 'docker ps' command
SET uniqueID=
FOR /f "tokens=1,2 delims==" %%a IN (.info) DO (
  echo %%a %%b
  IF %%~a==uniqueid SET uniqueID=%%b
)
:: FOR /F "tokens=1 skip=1 delims= %TAB%" %%v IN ('docker ps') DO set lastContainerID=%%v
IF NOT [%uniqueID%]==[""] ( 
  ECHO Attaching to Container ID=%uniqueID%
  :: Start attached terminal in new process.
  START CMD /k docker exec -it %uniqueID% bash
)

CMD /k