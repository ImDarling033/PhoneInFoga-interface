

## Arborescence du projet

```
INTERFACE PHONEINFOGO
├── static
│   ├── bootstrap.min.css
│   ├── darkmode.js
│   └── styles.css
├── templates
│   ├── index.html
│   └── shutdown.html
├── app.py
├── history.json
├── phoneinfoga.exe
├── setup.bat
└── start.bat
```

## Description des fichiers

### 1. **Dossier `static/`**

Ce dossier contient les fichiers statiques, tels que les feuilles de style CSS et les scripts JavaScript.

#### 1.1 `darkmode.js`

Ce script gère le mode sombre de l'interface en modifiant dynamiquement le style de la page et en sauvegardant l'état dans `localStorage`.

```javascript
document.addEventListener("DOMContentLoaded", function () {
    const darkModeToggle = document.getElementById("darkModeToggle");
    const body = document.body;

    if (localStorage.getItem("darkMode") === "enabled") {
        body.classList.add("dark-mode");
        darkModeToggle.textContent = "☀ Mode Clair";
    }

    darkModeToggle.addEventListener("click", function () {
        body.classList.toggle("dark-mode");

        if (body.classList.contains("dark-mode")) {
            localStorage.setItem("darkMode", "enabled");
            darkModeToggle.textContent = "☀ Mode Clair";
        } else {
            localStorage.setItem("darkMode", "disabled");
            darkModeToggle.textContent = "🌙 Mode Sombre";
        }
    });
});
```

#### 1.2 `styles.css`

Fichier contenant les styles de l'interface utilisateur, y compris ceux nécessaires pour le mode sombre.

```css
.dark-mode {
    background-color: #121212;
    color: #ffffff;
}
.dark-mode .alert {
    background-color: #333;
    color: #ffffff;
    border-color: #555;
}
```

### 2. **Dossier `templates/`**

Ce dossier contient les modèles HTML utilisés par Flask.

#### 2.1 `index.html`

Page principale où l'utilisateur peut entrer un numéro à analyser.

```html
<form method="POST">
    <label for="phoneNumber" class="form-label">Entrez un numéro :</label>
    <input type="text" class="form-control mb-3" id="phoneNumber" name="phoneNumber" required>
    <button type="submit" class="btn btn-primary">🤖 Lancer l'analyse</button>
</form>
```

#### 2.2 `shutdown.html`

Affiche un message lorsque le serveur Flask est arrêté.

```html
<h2 class="text-danger">Le serveur Flask a été arrêté.</h2>
<p>Vous pouvez fermer cette page.</p>
```

### 3. **Fichier Principal (`app.py`)**

L'application Flask gère les routes suivantes :

- `/` : Page principale pour l'analyse des numéros
- `/shutdown` : Arrêt du serveur Flask

Elle enregistre également l'historique des numéros analysés dans `history.json`.

```python
@app.route("/", methods=["GET", "POST"])
def index():
    result = None
    history = load_history()
    phone_number = None
    
    if request.method == "POST":
        phone_number = request.form["phoneNumber"]
        save_to_history(phone_number)
```

### 4. **Fichiers Utilitaires**

#### 4.1 `history.json`

Stocke les 10 dernières recherches effectuées.

#### 4.2 `phoneinfoga.exe`

Exécutable utilisé pour analyser un numéro de téléphone.

#### 4.3 `setup.bat`

Script d'installation qui :

- Vérifie et installe Python et Flask si nécessaire
- Lance automatiquement le serveur Flask

```bat
:: Vérifier si Python est installé
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [INFO] Python non détecté. Installation en cours...
    curl -o python_installer.exe https://www.python.org/ftp/python/3.11.5/python-3.11.5-amd64.exe
    start /wait python_installer.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
)
```

#### 4.4 `start.bat`

Script batch qui :

- Vérifie le format du numéro fourni
- Exécute `phoneinfoga.exe` pour analyser le numéro
- Sauvegarde le résultat dans un fichier `log.[numéro].txt`

```bat
set phoneNumber=%1
if "%phoneNumber%"=="" (
    echo Erreur : aucun numéro fourni.
    exit /b
)
"phoneinfoga.exe" scan -n %phoneNumber% > log.%phoneNumber%.txt
```

## Fonctionnalités Principales

### 1. **Interface Utilisateur**

- Formulaire pour entrer un numéro
- Historique des recherches
- Activation/désactivation du mode sombre

### 2. **Analyse des Numéros**

- Exécution de `phoneinfoga.exe` pour récupérer des informations
- Affichage des résultats directement sur l'interface

### 3. **Historique des Recherches**

- Sauvegarde automatique dans `history.json`
- Affichage des 10 dernières recherches

### 4. **Arrêt du Serveur Flask**

- Possibilité d'arrêter le serveur via l'interface utilisateur

## Installation et Utilisation

### 1. **Installation**

Exécutez `setup.bat` pour installer automatiquement Python et Flask.

### 2. **Lancement de l'Interface**

1. Lancez `setup.bat` (ceci démarre le serveur Flask automatiquement).
2. Accédez à `http://127.0.0.1:5001/` dans votre navigateur.

### 3. **Arrêt du Serveur**

Accédez à `http://127.0.0.1:5001/shutdown` ou cliquez sur "Arrêter le serveur" dans l'interface.

## Améliorations Possibles

- Ajout d'une authentification pour sécuriser l'accès
- Interface améliorée avec Bootstrap 5
- Intégration d'une API externe pour enrichir les analyses