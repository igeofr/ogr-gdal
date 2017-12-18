@echo on
setlocal enableextensions

set WORKSPACE=XXXX\XXXX\PARCELLAIRE\DEP_XXXX

cd /d %WORKSPACE%

for /f "tokens=*" %%A in ('dir /b /ad "%WORKSPACE%"') do (
    for /f "tokens=*" %%G in ('dir "%%~dpnA" /b /a-d') do (
        MKDIR %WORKSPACE%\%%A\TAR
        call "C:\Program Files\7-Zip\7z.exe" e %%~dpnA\%%G -o%WORKSPACE%\%%A\TAR\ -r

        MKDIR %WORKSPACE%\%%A\FEUILLES
        MKDIR %WORKSPACE%\%%A\FEUILLES\%%~nG
        call "C:\Program Files\7-Zip\7z.exe" e %WORKSPACE%\%%A\TAR\%%~nG -o%WORKSPACE%\%%A\FEUILLES\%%~nG\ -r

        MKDIR %WORKSPACE%\%%A\FEUILLES_SHP
        MKDIR %WORKSPACE%\%%A\FEUILLES_SHP\%%~nG
        call ogr2ogr -f "ESRI Shapefile" %WORKSPACE%\%%A\FEUILLES_SHP\%%~nG %WORKSPACE%\%%A\FEUILLES\%%~nG\*.THF

        MKDIR %WORKSPACE%\%%A\COMMUNE
        call ogr2ogr -f "ESRI shapefile" -append %WORKSPACE%\%%A\COMMUNE %WORKSPACE%\%%A\FEUILLES_SHP\%%~nG        
      )
    (
	  MKDIR %WORKSPACE%\FUSION
    call ogr2ogr -f "ESRI shapefile" -append %WORKSPACE%\FUSION %WORKSPACE%\%%A\COMMUNE
    )
)

pause
Endlocal
exit
