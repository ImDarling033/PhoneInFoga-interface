@echo off
setlocal
set phoneNumber=%1

if "%phoneNumber%"=="" (
    echo Erreur : aucun numéro fourni.
    exit /b
)

:: Vérification du format
if not "%phoneNumber:~0,1%"=="+" (
    echo Erreur : le numero doit commencer par '+'.
    exit /b
)

:: Exécuter PhoneInfoga en local
set logFile=log.%phoneNumber%.txt
"phoneinfoga.exe" scan -n %phoneNumber% > %logFile%

:: Retourner le résultat
echo Analyse terminee. Résultats :
type %logFile%
