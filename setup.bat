@echo off
setlocal enabledelayedexpansion
title Installation de Python & Flask

:: Vérifier si Python est installé
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [INFO] Python non détecté. Installation en cours...
    
    :: Télécharger Python (dernière version stable)
    curl -o python_installer.exe https://www.python.org/ftp/python/3.11.5/python-3.11.5-amd64.exe
    
    echo [INFO] Installation de Python...
    start /wait python_installer.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

    :: Supprimer l'installeur après installation
    del python_installer.exe
) else (
    echo [OK] Python est déjà installé.
)

:: Vérifier si pip est installé
pip --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [INFO] Pip non détecté. Installation en cours...
    python -m ensurepip --default-pip
) else (
    echo [OK] Pip est déjà installé.
)

:: Vérifier si Flask est installé
pip show flask >nul 2>&1
if %errorlevel% neq 0 (
    echo [INFO] Installation de Flask...
    pip install flask
) else (
    echo [OK] Flask est déjà installé.
)

:: Lancer le serveur Flask en arrière-plan
echo [INFO] Démarrage du serveur Flask...
start /min cmd /c "python app.py"

:: Attendre 3 secondes puis ouvrir le navigateur
timeout /t 3 >nul
start http://127.0.0.1:5001/

echo [OK] Flask est lancé. Vous pouvez fermer cette fenêtre.
echo.
echo [INFO] Tapez 1 pour fermer Flask.
echo [INFO] Tapez 2 pour quitter sans fermer Flask.
set /p choix="Votre choix : "

if "%choix%"=="1" (
    echo [INFO] Fermeture de Flask...
    taskkill /IM python.exe /F
    echo [OK] Flask a été arrêté.
) else (
    echo [INFO] Vous avez choisi de laisser Flask tourner.
)

exit
