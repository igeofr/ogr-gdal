OGR-GDAL et autres
========

## Commandes OGR/GDAL :

### OGR2OGR :
- Conversion d'un shapefile 2D en dxf 3D

```sh
ogr2ogr -f "DXF" out.dxf in.shp -zfield "ELEVATION"
```

- Téléchargement de données à partir d'un flus WFS

```sh
ogr2ogr  -f 'ESRI Shapefile' "out.shp" "WFS:in"
```

- Conversion d'un shapefile en MID/MIF

```sh
ogr2ogr --config SHAPE_ENCODING "utf-8" -progress -lco ENCODING=utf-8 -f "MapInfo File" -dsco "FORMAT=MIF" -dsco "SPATIAL_INDEX_MODE=QUICK/OPTIMIZED" "OUT_FOLDER" "IN_FOLDER"
```

### GDALTINDEX :
- Création d'un index en contournant l'erreur : Argument list too long 

```sh
find /Users/.../ -name '*.jpg' -exec gdaltindex /Users/.../index.shp {} \;
```

```sh
find ./ -type f \( -iname \*.jp2 -o -iname \*.JP2 \) -exec gdaltindex /Users/.../index.shp {} \;
```

---

### ASC problème de NS resolution

```sh
for file in *.asc; 
    # adjust NS resolution 
    do echo "$file"; gdalwarp -s_srs "EPSG:2154" -t_srs "EPSG:2154" -overwrite "$file" "$(basename "$file" .asc).tif"
done

gdalbuildvrt merge_file.vrt *.tif
```
---

### Autres commandes utiles :

- Permet de lister les fichiers dans un fichier texte

```sh
ls /Volumes/<nom de ton volume>/<...>/* > tonfichier.txt
```
- Changer l'encodage d'un fichier dbf - UTF-8 > ISO-8859-1

```sh
/Applications/LibreOffice.app/Contents/MacOS/soffice --calc --convert-to dbf:dBASE:1 --infilter=dBASE:76 ./test/*.dbf
```

- Convertir et changer l'encodage d'un fichier dbf vers csv - UTF-8 > ISO-8859-1

```sh
/Applications/LibreOffice.app/Contents/MacOS/soffice --calc --convert-to csv:"Text - txt - csv (StarCalc):44,34,ANSI,1,,0,false,true,true" --infilter=dBASE:76 ./test/*.dbf
```
- Permet de remplacer une chaine de caractères

```sh
for i in *; do mv "$i" "$(echo $i | tr "85_" "1985_")"; done : Remplacer des caractères dans des dossiers
```

**Autres sources :**
* [gdal/ogr cheatsheet](https://github.com/glw/gdalcheatsheet)
* [Cheat sheet for GDAL/OGR command-line geodata tools](https://github.com/dwtkns/gdal-cheat-sheet)
* [Creating BigTiff COGS for raster RGB photos from a tile mosaic directory using GDAL](https://gist.github.com/palmerj/ac1e19eb81c986d9634e3a3de7cdfc3d)
