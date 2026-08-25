# Salesmotion Data Pipeline (Python & BigQuery & DBT Core)

Ce projet est un pipeline d'ingestion de données automatisé (*ELT*) qui extrait les informations d'entreprises et leurs offres d'emploi depuis l'API **Salesmotion**, puis les charge dans **Google BigQuery** pour préparer la modélisation sous **dbt Core**.

---

## Architecture du projet

```text
.
├── .gitignore                      # Fichiers et dossiers ignorés (env, checkpoints, etc.)
├── README.md                       # Documentation du projet
├── sales_motion_api_request.ipynb  # Notebook d'ingestion (API -> BigQuery)
└── salesmotion_dbt/                # Projet dbt Core
    ├── dbt_project.yml             # Configuration dbt
    ├── profiles.yml                # Profil de connexion BigQuery
    └── models/                     # Modèles SQL (staging, marts)
        └── staging/
            ├── schema_source.yml
            └── stg_job_openings.sql
```

---

## Prérequis pour réaliser ce projet

- **Python 3.10+**
- Un compte **Google Cloud Platform (GCP)** avec BigQuery activé.
- Une clé API valide **Salesmotion**.
- Un fichier de variables d'environnement `.env` configuré à la racine avec comme variable :

SALESMOTION_API_KEY="votre_cle_api"

GOOGLE_APPLICATION_CREDENTIALS="votre_cle_json"

GCP_PROJECT_ID="votre_project_id_gcp"
