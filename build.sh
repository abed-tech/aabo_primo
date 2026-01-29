#!/usr/bin/env bash
# Script de build pour déploiement Django sur toutes plateformes

set -o errexit  # Arrêter en cas d'erreur

echo "🚀 Début du build Django..."

# Installer les dépendances
echo "📦 Installation des dépendances..."
pip install -r requirements.txt

# Collecter les fichiers statiques
echo "📁 Collection des fichiers statiques..."
python manage.py collectstatic --no-input --clear

# Exécuter les migrations
echo "🗄️  Exécution des migrations..."
python manage.py migrate --no-input

echo "✅ Build terminé avec succès!"
