OGR-GDAL
========
Commandes OGR/GDAL

GDALTINDEX :

- Permet de créer un index en contournant l'erreur : gdaltindex: Argument list too long 

```
find /Users/.../ -name '*.jpg' -exec gdaltindex /Users/.../index.shp {} \;
```
