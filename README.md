OGR-GDAL et autres
========

**Commandes OGR/GDAL :**

OGR2OGR :
- Convertion d'un shape 2D en dxf 3D
```
ogr2ogr -f "DXF" out.dxf in.shp -zfield "ELEVATION"
```
- Téléchargement de données à partir d'un flus WFS
```
ogr2ogr  -f 'ESRI Shapefile' "out.shp" "WFS:in"
```

GDALTINDEX :
- Création d'un index en contournant l'erreur : Argument list too long 
```
find /Users/.../ -name '*.jpg' -exec gdaltindex /Users/.../index.shp {} \;
```
```
find ./ -type f \( -iname \*.jp2 -o -iname \*.JP2 \) -exec gdaltindex /Users/.../index.shp {} \;
```
---

**Autres commandes utiles :** 
- Permet de lister les fichiers dans un fichier texte
```
ls /Volumes/<nom de ton volume>/<...>/* > tonfichier.txt
```
- Changer l'encodage d'un fichier dbf - UTF-8 > ISO-8859-1
```
/Applications/LibreOffice.app/Contents/MacOS/soffice --calc --convert-to dbf:dBASE:1 --infilter=dBASE:76 ./test/*.dbf
```
- Convertir et changer l'encodage d'un fichier dbf vers csv - UTF-8 > ISO-8859-1
```
/Applications/LibreOffice.app/Contents/MacOS/soffice --calc --convert-to csv:"Text - txt - csv (StarCalc):44,34,ANSI,1,,0,false,true,true" --infilter=dBASE:76 ./test/*.dbf
```

**Autres sources :**
* [gdal/ogr cheatsheet](https://github.com/glw/gdalcheatsheet)
* [Cheat sheet for GDAL/OGR command-line geodata tools](https://github.com/dwtkns/gdal-cheat-sheet)
* [Creating BigTiff COGS for raster RGB photos from a tile mosaic directory using GDAL](https://gist.github.com/palmerj/ac1e19eb81c986d9634e3a3de7cdfc3d)
