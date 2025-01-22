# Guildo - Application de Filtrage de Restaurants

https://img.shields.io/badge/Flutter-3.27.2-blue

https://img.shields.io/badge/license-MIT-green

Guildo (Jeu de mots : ZeGuild + Resto) est une application mobile développée avec Flutter permettant d'afficher et de filtrer une liste de restaurants en fonction du type de cuisine. Cette application repose sur un backend personnalisé construit avec **Supabase** pour stocker et récupérer les données. Ce projet a été développé dans le cadre d'un test technique et met en œuvre une architecture MVVM avec `refreshed` (fork de **GetX**), la pagination infinie et une gestion efficace des données provenant d'une api.

# 🚀 Fonctionnalités

- Liste paginée de restaurants avec chargement infini.
- Filtrage des restaurants par :
    - Type de cuisine.
- Interface utilisateur simple et réactive.
- Gestion des états de chargement avec des indicateurs visuels.
- Intégration de l'API Supabase pour la gestion des données.

# 🛠️ Technologies utilisées

- **Flutter 3.27.2**
- **Dart 3.6.1**
- **Supabase (PostgreSQL, Auth, Storage)**
- **Architecture MVVM (Model-View-ViewModel)**

## Packages principaux

| Package | Version | Fonctionnalité |
| --- | --- | --- |
| `refreshed` | ^2.10.4 | Gestion améliorée des états GetX |
| `quickly` | ^6.1.1 | Outils rapides pour Flutter |
| `flutter_screenutil` | ^5.9.3 | Adaptation responsive |
| `extended_image` | ^9.1.0 | Gestion avancée des images |
| `infinite_scroll_pagination` | ^4.1.0 | Pagination infinie |
| `shimmer` | ^3.0.0 | Effet de chargement |
| `supabase_flutter` | ^2.8.3 | Connexion au backend Supabase |

# 📂 Structure du projet

La structure du projet est organisée de manière modulaire, facilitant la maintenance et l'extension :

```
lib/
├── main.dart             # Point d'entrée de l'application.
├── config/               # Fichiers de configuration.
│   ├── app_constants.dart # Constantes globales (URLs, clés API, etc.).
│   ├── app_routes.dart    # Définition des routes de navigation.
│   └── ...               # Autres fichiers de configuration.
├── controllers/          # Logique métier et gestion de l'état (GetX Controllers).
│   ├── home_controller.dart # Contrôleur pour l'écran d'accueil.
│   ├── restaurants_controller.dart # Contrôleur pour la gestion des restaurants.
│   ├── splash_controller.dart # Contrôleur pour l'écran de splash.
│   └── ...               # Contrôleurs pour d'autres écrans ou fonctionnalités.
├── features/             # Fonctionnalités ou écrans principaux (Views, Bindings).
│   ├── splash/           # Écran de démarrage.
│   │   ├── splash_page.dart # Widget de la page de démarrage.
│   │   ├── splash_binding.dart # Injection des dépendances.
│   │   └── ...               # Autres widgets ou fichiers spécifiques à splash.
│   ├── home/             # Écran principal (liste des restaurants).
│   │   ├── home_page.dart   # Widget de la page d'accueil.
│   │   ├── home_binding.dart # Injection des dépendances.
│   │   └── widgets/        # Widgets spécifiques à l'écran d'accueil.
│   │       ├── restaurant_card.dart
│   │       └── ...
│   └── ...               # Autres fonctionnalités ou écrans.
├── models/               # Modèles de données.
│   ├── restaurant.dart  # Modèle pour les restaurants.
│   ├── cuisine.dart     # Modèle pour les types de cuisine.
│   ├── address.dart     # Modèle pour les adresses.
│   └── ...               # Modèles pour d'autres données.
├── services/             # Services et providers (communication avec les APIs, Supabase).
│   ├── supabase_connector.dart # Connexion et client Supabase.
│   ├── restaurants_provider.dart # Fournisseur de données pour les restaurants.
│   └── ...               # Autres services.
├── themes/               # Définition des thèmes et des styles.
│   ├── app_colors.dart    # Définition des couleurs.
│   ├── app_theme.dart     # Définition du thème principal.
│   └── ...               # Autres fichiers de style.
├── utils/                # Fonctions utilitaires et helpers.
│   ├── logger.dart        # Gestion de la journalisation.
│   ├── validators.dart    # Validation des formulaires.
│   └── ...               # Autres utilitaires.
└── widgets/              # Widgets réutilisables globalement.
    ├── custom_button.dart # Bouton personnalisé.
    ├── loading_indicator.dart # Indicateur de chargement.
    └── ...               # Autres widgets réutilisables.
```

## ⚙️ Installation et configuration

1. **Clonez le dépôt :**

    ```bash
    git clone https://github.com/Samuelbenny/guildo.git
    cd guildo
    ```

2. **Installez les dépendances :**

    ```bash
    flutter pub get
    ```

3. **Générer le code :**

    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4. **Lancez l'application :**

    ```bash
    flutter run
    ```


# 🧪 Tests

Pour exécuter les tests unitaires :

```bash
flutter test
```

# 🏗️ Approche de développement

L'application suit une approche **MVVM (Model-View-ViewModel)** qui permet de séparer clairement la logique métier de l'interface utilisateur.

- **Données:** Supabase est utilisé pour stocker les informations des restaurants, ce qui offre une solution rapide et flexible.
- **Filtrage:** Un filtre dynamique est appliqué en fonction des préférences de l'utilisateur via une `BottomSheet`.
- **Pagination:** `infinite_scroll_pagination` est utilisé pour améliorer l'expérience utilisateur avec le chargement progressif des données.
- **Gestion de l'état:** `GetX` est exploité pour gérer efficacement l'état et les interactions UI.

# 📸 Captures d'écran

| Liste des restaurants | Filtrage |
| --- | --- |
|  |  |

# 🤝 Contribution

Les contributions sont les bienvenues !

- Forkez le projet
- Créez une branche : `git checkout -b feature/nouvelle-fonctionnalite`
- Faites un commit : `git commit -m "Ajout d'une nouvelle fonctionnalité"`
- Poussez : `git push origin feature/nouvelle-fonctionnalite`
- Ouvrez une **Pull Request**

# 📄 Licence

Ce projet est sous licence MIT. Consultez le fichier LICENSE pour plus d’informations.

---

👨‍💻 Développé par **Samuel Benit-in**