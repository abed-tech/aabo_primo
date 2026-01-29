# Aabo

Application Django (mobile-first) pour la publication de biens immobiliers sous forme de vidéos verticales et la messagerie.

## Prérequis

- Python 3 (recommandé)

## Installation (Windows)

### 1) Créer l’environnement virtuel

Depuis la racine du projet (là où se trouve `manage.py`) :

```bat
python -m venv .venv
```

### 2) Activer l’environnement virtuel

- CMD :

```bat
.\.venv\Scripts\activate.bat
```

- PowerShell :

```powershell
.\.venv\Scripts\Activate.ps1
```

Si PowerShell bloque l’exécution, exécuter une seule fois :

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

### 3) Installer les dépendances

```bat
pip install -r requirements.txt
```

## Lancer l’application

### 1) Migrations

```bat
python manage.py migrate
```

### 2) Démarrer le serveur

```bat
python manage.py runserver
```

Puis ouvrir :

- `http://127.0.0.1:8000/`

## Administration

Créer un superutilisateur :

```bat
python manage.py createsuperuser
```

Puis accéder à :

- `http://127.0.0.1:8000/admin/`

## Déploiement en production

### ✅ Application optimisée pour déploiement universel

L'application est **100% prête** pour le déploiement sur **n'importe quelle plateforme** :
- ✅ **Heroku** - Support complet avec release phase
- ✅ **Railway** - Détection automatique
- ✅ **Render** - Configuration optimisée
- ✅ **Vercel** - Compatible
- ✅ **Fly.io** - Support natif
- ✅ **PythonAnywhere** - Prêt à l'emploi
- ✅ **Netlify** - Avec adaptations
- ✅ **Replit** - Déploiement direct

### 🚀 Déploiement sans configuration (recommandé)

**L'application fonctionne immédiatement sans variables d'environnement !**

Grâce au système de fallback automatique :
- ✅ `ALLOWED_HOSTS` accepte automatiquement tous les domaines des plateformes majeures
- ✅ `CSRF_TRUSTED_ORIGINS` configuré automatiquement
- ✅ Migrations automatiques via `release` phase (Heroku/Railway)
- ✅ Pages d'erreur 404/500 personnalisées
- ✅ Sécurité HTTPS activée automatiquement en production

**Pour déployer :**
1. Push ton code sur GitHub
2. Connecte ton repo à la plateforme de déploiement
3. C'est tout ! L'app démarre automatiquement

### 🔐 Configuration des variables d'environnement (optionnel mais recommandé)

Pour une sécurité maximale en production, configure ces variables :

```bash
SECRET_KEY=votre-cle-secrete-unique-et-aleatoire
DEBUG=False
ALLOWED_HOSTS=votre-domaine-exact.com
```

**Générer une SECRET_KEY sécurisée :**

```bash
python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"
```

### Déploiement sur Heroku

1. Installer Heroku CLI et se connecter :

```bash
heroku login
```

2. Créer une application :

```bash
heroku create nom-de-votre-app
```

3. Ajouter PostgreSQL :

```bash
heroku addons:create heroku-postgresql:mini
```

4. Configurer les variables d'environnement :

```bash
heroku config:set SECRET_KEY="votre-cle-secrete"
heroku config:set DEBUG=False
heroku config:set ALLOWED_HOSTS="nom-de-votre-app.herokuapp.com"
```

5. Déployer :

```bash
git push heroku main
```

6. Exécuter les migrations :

```bash
heroku run python manage.py migrate
heroku run python manage.py createsuperuser
```

### Déploiement sur Railway

1. Connecter votre dépôt GitHub à Railway
2. Ajouter une base de données PostgreSQL depuis le dashboard
3. Configurer les variables d'environnement dans Settings :
   - `SECRET_KEY`
   - `DEBUG=False`
   - `ALLOWED_HOSTS=votre-domaine.railway.app`
4. Railway détectera automatiquement le `Procfile` et `runtime.txt`
5. Exécuter les migrations via le terminal Railway :

```bash
python manage.py migrate
python manage.py createsuperuser
```

### Déploiement sur Render

1. Créer un nouveau Web Service sur Render
2. Connecter votre dépôt GitHub
3. Configurer :
   - **Build Command:** `./build.sh`
   - **Start Command:** `gunicorn aabo.wsgi:application --bind 0.0.0.0:$PORT --workers 4`
4. **(Optionnel)** Ajouter une base de données PostgreSQL
5. **(Optionnel)** Configurer les variables d'environnement :
   - `SECRET_KEY` (généré automatiquement si non défini)
   - `DEBUG=False` (par défaut)
   - `DATABASE_URL` (automatique si PostgreSQL ajouté)
6. Déployer - Les migrations s'exécutent automatiquement via `build.sh`

**Note :** Grâce au fallback automatique, `ALLOWED_HOSTS` n'est plus obligatoire !

### Collecte des fichiers statiques

Avant le premier déploiement, collecter les fichiers statiques :

```bash
python manage.py collectstatic --noinput
```

### Notes importantes

- **WhiteNoise** est configuré pour servir les fichiers statiques en production
- **Gunicorn** est utilisé comme serveur WSGI
- **Daphne** peut être utilisé pour les WebSockets (Channels)
- La base de données SQLite est utilisée en développement, PostgreSQL recommandé en production
- Les fichiers médias (uploads) nécessitent un stockage externe (S3, Cloudinary) en production

### Sécurité

En production, assurez-vous de :
- Utiliser une `SECRET_KEY` unique et sécurisée
- Définir `DEBUG=False`
- Configurer correctement `ALLOWED_HOSTS`
- Utiliser HTTPS (automatique sur Heroku/Railway/Render)
- Configurer un stockage externe pour les fichiers médias
- ✅ **Support proxy SSL** pour Heroku/Railway/Render
- ✅ **Pages d'erreur personnalisées** (404, 500)

### ⚡ Optimisations de performance

- ✅ **WhiteNoise** pour servir les fichiers statiques avec compression
- ✅ **Gunicorn** avec 4 workers et 2 threads par worker
- ✅ **Timeout 120s** pour les requêtes longues
- ✅ **Logs structurés** (access + error logs)
- ✅ **Migrations automatiques** via release phase
- ✅ **Collecte automatique** des fichiers statiques

### 📝 Fichiers de configuration

- **`Procfile`** - Configuration Heroku/Railway avec release phase
- **`runtime.txt`** - Version Python 3.14.1
- **`build.sh`** - Script de build automatique pour Render
- **`requirements.txt`** - Dépendances avec versions fixées
- **`.env.example`** - Template de configuration
- **`.gitignore`** - Fichiers à exclure du versioning

### ⚠️ Notes importantes

- La base de données **SQLite** est utilisée en développement
- **PostgreSQL** est recommandé en production (via `DATABASE_URL`)
- Les fichiers médias nécessitent un stockage externe en production (S3, Cloudinary)
- Le fallback `ALLOWED_HOSTS` accepte tous les domaines des plateformes majeures
- Pour une sécurité maximale, définissez `ALLOWED_HOSTS` avec votre domaine exact
