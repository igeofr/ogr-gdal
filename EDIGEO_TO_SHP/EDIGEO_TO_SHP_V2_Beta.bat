@echo on
setlocal enableextensions

set WORKSPACE=XXXX\XXXX\PARCELLAIRE\DEP_XXXX
set /p ANNEE=Saisir l'annee: 

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
		MKDIR %WORKSPACE%\FUSION

		for %%f in (%WORKSPACE%\%%A\FEUILLES_SHP\%%~nG\*.shp) do (

			call ogr2ogr -f "ESRI shapefile" -s_srs EPSG:2154 -t_srs EPSG:3944 -append "%WORKSPACE%\%%A\COMMUNE\%%~nf_%%A_%ANNEE%.shp" "%%f"


			call ogr2ogr -f "ESRI shapefile" -s_srs EPSG:2154 -t_srs EPSG:3944 -append "%WORKSPACE%\FUSION\%%~nf_%ANNEE%.shp" "%%f"
			
			call ogrinfo -dialect sqlite -sql "select distinct geometry from %%~nf_%ANNEE%" "%WORKSPACE%\FUSION\%%~nf_%ANNEE%.shp
		)
	)
	
		 
)

pause
Endlocal
exit
