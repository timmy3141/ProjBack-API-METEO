# API de relevés météo

Projet backend réalisé dans le cadre du module 'Proj_Back' au CPNV.

L’API permettra de gérer des stations météo et leurs relevés, puis de consulter l’historique d’une station

## Technologies

- Node.js et Express pour l’API REST.
- MySQL et mysql2 pour les données.
- Swagger pour la documentation des routes.
- Postman pour les tests.
- Nodemon pour le développement.

## Installation

Prérequis : Node.js avec npm, un serveur MySQL démarré et Git.

```bash
npm install
```

## Initialisation de la base

Dans HeidiSQL, ouvrir une session connectée au serveur MySQL et exécuter les fichiers dans cet ordre :

1. `db/schema.sql` pour créer la base `api_meteo` et les tables `station` et `releve`.
2. `db/data.sql` pour ajouter des données fictives.

## Organisation

```text
app.js             Point d’entrée Express
swagger.js         Configuration Swagger
helper.js          Validation des données
routes/            Routes des stations et des relevés
db/                Connexion MySQL, requêtes et scripts SQL
middlewares/       Vérification du token
```

## Démarrage

La commande de démarrage :

```bash
npm run dev
```

## Branches

- `dev` pour les développements en cours.
- `main` pour les versions stables validées.
- `Documentation` pour les documents du projet.
