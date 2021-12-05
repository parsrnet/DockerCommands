:: Spin up a new Docker container ::
@ECHO OFF
:: Image name
SET imageName=

IF EXIST .info (
  FOR /f "delims== tokens=1,2" %%a IN (.info) DO (
    IF %%a=="imagename" (
      SET imageName=%%b
    )
  )
)

IF NOT [%imageName%]==[""] (
  
  docker run -dit %imageName% bash > tempid & ECHO Successfully created container using image %imageName%. Use 'attach' to connect to container object.
  >>.info SET /p __="uniqueid="
  cat tempid >> .info
  DEL tempid
) ELSE (
  ECHO No suitable container found. Make sure you run build.bat before running spinup.bat and that the build file ran successfully with a valid name.
)