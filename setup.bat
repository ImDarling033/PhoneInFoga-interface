@echo off
setlocal enabledelayedexpansion
title Installation de Python & Flask

:: Vérifier si Python est installé
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [INFO] Python non detecte. Installation en cours...
    
    :: Télécharger et installer Python
    curl -o python_installer.exe https://www.python.org/ftp/python/3.11.5/python-3.11.5-amd64.exe
    start /wait python_installer.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

    :: Supprimer l'installeur après installation
    del python_installer.exe

    :: Appliquer les changements de chemin
    setx PATH "%PATH%;C:\Program Files\Python311;C:\Program Files\Python311\Scripts"
    
    echo [OK] Python a ete installe. Redemarrez votre terminal si necessaire.
) else (
    echo [OK] Python est deja installe.
)

:: Forcer la mise à jour de pip
python -m ensurepip --default-pip
python -m pip install --upgrade pip

:: Vérifier si Flask est installé
python -m pip show flask >nul 2>&1
if %errorlevel% neq 0 (
    echo [INFO] Installation de Flask...
    python -m pip install flask
) else (
    echo [OK] Flask est deja installe.
)

:: Démarrer Flask en arrière-plan
echo [INFO] Demarrage du serveur Flask...
start /min cmd /c "python app.py"

:: Attendre quelques secondes puis ouvrir le navigateur
timeout /t 3 >nul
start http://127.0.0.1:5001/

echo [OK] Flask est lance.
echo.
echo [INFO] Tapez 1 pour fermer Flask.
echo [INFO] Tapez 2 pour quitter sans fermer Flask.
set /p choix="Votre choix : "

if "%choix%"=="1" (
    echo [INFO] Fermeture de Flask...
    taskkill /IM python.exe /F
    echo [OK] Flask a ete arrete.
) else (
    echo [INFO] Vous avez choisi de laisser Flask tourner.
)

exit
