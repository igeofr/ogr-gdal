OGR-GDAL
========

Commandes OGR/GDAL

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
Autres commandes utiles : 
```
ls /Volumes/<nom de ton volume>/<...>/* > tonfichier.txt
```
