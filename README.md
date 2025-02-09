---
ENG-🇬🇧
---

# PhoneInFoga-interface

## 📌 Table of Contents
- [🌳 Structure](#-structure)
- [👨‍💻 Instructions](#-instructions)
- [🛠 Dependencies](#-dependencies)
- [🚀 Usage](#-usage)
- [🔗 Original Project](#-original-project)
- [❓ Issues and Solutions](#-issues-and-solutions)

## 🌳 Structure

##### File tree representation.

```md
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

## 👨‍💻 Instructions

### Installation
1. Download **[PhoneInfoga](https://github.com/sundowndev/PhoneInfoga)**.
2. Place the `phoneinfoga.exe` executable in the **root folder** of the project.
3. Run **setup.bat**, which will install the necessary dependencies.
4. Launch **start.bat** to start the interface.

##### ⚠️ DO NOT CLOSE THE TWO TERMINALS DURING EXECUTION

## 🛠 Dependencies
- Python 3.x
- Flask
- Bootstrap
- jQuery

## 🚀 Usage

1. Open a browser and go to `http://127.0.0.1:5000`
2. Enter a phone number to retrieve information.
3. Check the search history and easily copy numbers.
4. Dark mode available with the 🌙 button.

## 🔗 Original Project

This project is a graphical interface for **[PhoneInfoga](https://github.com/sundowndev/PhoneInfoga)**, an open-source phone number intelligence tool.

[![GitHub](https://img.shields.io/badge/GitHub-PhoneInfoga-blue?logo=github)](https://github.com/sundowndev/PhoneInfoga)

## ❓ Issues and Solutions

- **Issue: Flask does not start**
  - Check that Python is installed and accessible in the system PATH.
  - Ensure that `setup.bat` has installed all required dependencies.

- **Issue: No results for a number**
  - Verify that `phoneinfoga.exe` is correctly placed in the root folder.
  - Try another number, as some may not have available data.

---

💡 **Future Improvements:** Adding a logging system and better error handling.

---
FR-🇫🇷
---

# PhoneInFoga-interface

## 📌 Table des Matières
- [🌳 Représentation](#-représentation)
- [👨‍💻 Instructions](#-instructions)
- [🛠 Dépendances](#-dépendances)
- [🚀 Utilisation](#-utilisation)
- [🔗 Projet d'origine](#-projet-dorigine)
- [❓ Problèmes et solutions](#-problèmes-et-solutions)

## 🌳 Représentation

##### Représentation en arborescence des fichiers.

```md
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

## 👨‍💻 Instructions

### Installation
1. Téléchargez **[PhoneInfoga](https://github.com/sundowndev/PhoneInfoga)**.
2. Placez l'exécutable `phoneinfoga.exe` dans le **dossier racine** du projet.
3. Exécutez **setup.bat**, qui installera les dépendances nécessaires.
4. Lancez le script **start.bat** pour démarrer l'interface.

##### PS : NE SURTOUT PAS FERMER LES DEUX TERMINAUX EN COURS D'EXÉCUTION

## 🛠 Dépendances
- Python 3.x
- Flask
- Bootstrap
- jQuery

## 🚀 Utilisation

1. Ouvrez un navigateur et accédez à `http://127.0.0.1:5000`
2. Entrez un numéro de téléphone pour obtenir des informations.
3. Consultez l'historique des recherches et copiez facilement les numéros.
4. Mode sombre disponible avec le bouton 🌙.

## 🔗 Projet d'origine

Ce projet est une interface graphique pour **[PhoneInfoga](https://github.com/sundowndev/PhoneInfoga)**, un outil open-source d'information sur les numéros de téléphone.

[![GitHub](https://img.shields.io/badge/GitHub-PhoneInfoga-blue?logo=github)](https://github.com/sundowndev/PhoneInfoga)

## ❓ Problèmes et solutions

- **Problème : Flask ne démarre pas**
  - Vérifiez que Python est bien installé et accessible dans le PATH.
  - Assurez-vous que `setup.bat` a bien installé toutes les dépendances.

- **Problème : Aucun résultat pour un numéro**
  - Vérifiez que `phoneinfoga.exe` est bien présent dans le dossier racine.
  - Essayez un autre numéro, certains peuvent ne pas être renseignés.

---

💡 **Améliorations futures :** Ajout d'un système de logs et meilleure gestion des erreurs.

