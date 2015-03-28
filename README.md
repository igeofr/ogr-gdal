OGR-GDAL
========
Commandes OGR/GDAL

OGR2OGR : 
- Permet de télécharger des données à partir d'un flus WFS
```
ogr2ogr  -f 'ESRI Shapefile' "out.shp" "WFS:in"
```

GDALTINDEX :

- Permet de créer un index en contournant l'erreur : Argument list too long 

```
find /Users/.../ -name '*.jpg' -exec gdaltindex /Users/.../index.shp {} \;
```
