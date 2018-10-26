@echo off

REM Build conda build command

SET BUILD=conda build --old-build-string -c bc-dev -c conda-forge -c anaconda recipes\esdl --output

REM Run build and loop through results

FOR /F  "tokens=*" %%b in ('%BUILD%') DO (
    anaconda -v -t %1 upload %%b --force
)


