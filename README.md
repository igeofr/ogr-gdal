OGR-GDAL
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
- Changer l'encodage de fichiers shp ou dbf - UTF-8 > ISO-8859-1
```
export SHAPE_ENCODING="UTF-8"
ogr2ogr -f "ESRI Shapefile" OUT.dbf IN.dbf -lco ENCODING=ISO-8859-1
```

GDALTINDEX :
- Création d'un index en contournant l'erreur : Argument list too long 
```
find /Users/.../ -name '*.jpg' -exec gdaltindex /Users/.../index.shp {} \;
```
```
find ./ -type f \( -iname \*.jp2 -o -iname \*.JP2 \) -exec gdaltindex /Users/.../index.shp {} \;
```

**Autres commandes utiles :** 
- Permet de lister les fichiers dans un fichier texte
```
ls /Volumes/<nom de ton volume>/<...>/* > tonfichier.txt
```
