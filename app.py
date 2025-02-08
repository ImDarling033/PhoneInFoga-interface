from flask import Flask, render_template, request, redirect, url_for
import subprocess
import os
import time
import json

app = Flask(__name__)
HISTORY_FILE = "history.json"

# Charger l'historique
def load_history():
    if os.path.exists(HISTORY_FILE):
        with open(HISTORY_FILE, "r", encoding="utf-8") as file:
            return json.load(file)
    return []

# Sauvegarder un numéro sans modifier le `+`
def save_to_history(phone_number):
    history = load_history()

    # Vérifier si le numéro est déjà dans l'historique
    if phone_number not in history:
        history.insert(0, phone_number)  # Ajouter en premier
        history = history[:10]  # Garder uniquement les 10 derniers

        # Écrire dans le fichier JSON
        with open(HISTORY_FILE, "w", encoding="utf-8") as file:
            json.dump(history, file, indent=4)

@app.route("/", methods=["GET", "POST"])
def index():
    result = None
    history = load_history()
    phone_number = None

    # Vérifier si on a reçu un numéro depuis l'historique ou un formulaire
    if request.method == "POST":
        phone_number = request.form["phoneNumber"]
    elif request.args.get("phoneNumber"):
        phone_number = request.args.get("phoneNumber")

    if phone_number:
        log_file = f"log.{phone_number}.txt"

        # Vérification du format
        if not phone_number.startswith("+") or not phone_number[1:].isdigit():
            result = "❌ Erreur : Numéro invalide !"
        else:
            save_to_history(phone_number)  # Sauvegarde du numéro

            # Si le fichier de log n'existe pas, exécuter PhoneInfoga
            if not os.path.exists(log_file):
                cmd = f'cmd /c "start.bat {phone_number}"'
                subprocess.run(cmd, shell=True)

            # Attendre un peu pour la création du fichier
            time.sleep(3)

            # Vérifier et lire le fichier de log
            if os.path.exists(log_file):
                with open(log_file, "r", encoding="utf-8") as file:
                    result = file.read()
            else:
                result = "⚠️ Erreur : Impossible de récupérer les résultats."

    return render_template("index.html", result=result, history=history, phone_number=phone_number)

@app.route("/shutdown", methods=["POST"])
def shutdown():
    """Arrêter le serveur Flask proprement"""
    import threading
    import signal

    def stop_server():
        time.sleep(2)
        os.kill(os.getpid(), signal.SIGTERM)

    threading.Thread(target=stop_server).start()
    return render_template("shutdown.html")

if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5001, debug=True)
