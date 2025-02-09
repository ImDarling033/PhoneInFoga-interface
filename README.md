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

