:: Build and create new image from .dockerfile. If no dockerfile path is specified, then uses default behavior (PATH/dockerfile). ::
@ECHO OFF
:: Dir to dockerfile
SET dockerfile="Dockerfile"
:: Any directory
SET contextPath="."
:: User-defined name
IF EXIST ".info" (
  FOR /f "delims== tokens=1,2" %%a IN (.info) DO (
    ECHO %%a %%b
    IF %%a==imagename (
      SET imageName=%%b
      GOTO :build
    )
  )
)

SET /p imageName="Enter a valid name for this Image: "

:build
docker build -f %dockerfile% -t %imageName% %contextPath% || ECHO Operation failed. See above for details. && PAUSE

IF ERRORLEVEL 0 (
  IF NOT EXIST ".info" ECHO imagename=%imageName% > .info
  ECHO Created new Image %imageName% & PAUSE
)