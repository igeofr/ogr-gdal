OGR-GDAL
========
Commandes OGR/GDAL

OGR2OGR :
- Convertion d'un shape 2D en dxf 3D
```
ogr2ogr -f "DXF" out.dxf in.shp -zfield "ELEVATION"
```

- Permet de télécharger des données à partir d'un flus WFS
```
ogr2ogr  -f 'ESRI Shapefile' "out.shp" "WFS:in"
```

GDALTINDEX :

- Permet de créer un index en contournant l'erreur : Argument list too long 

```
find /Users/.../ -name '*.jpg' -exec gdaltindex /Users/.../index.shp {} \;
```
