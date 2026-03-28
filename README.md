# 🇫🇷 France Pour Tous — Франция для всех

> Application Android bilingue FR/RU d'acculturation pour russophones souhaitant comprendre, vivre et s'intégrer en France.

[![Build Flutter APK](https://github.com/YOUR_USERNAME/france-pour-tous/actions/workflows/build.yml/badge.svg)](https://github.com/YOUR_USERNAME/france-pour-tous/actions/workflows/build.yml)
![Flutter](https://img.shields.io/badge/Flutter-3.22-blue?logo=flutter)
![Platform](https://img.shields.io/badge/Platform-Android-green?logo=android)
![Languages](https://img.shields.io/badge/Languages-FR%20%7C%20RU-orange)

---

## 📱 Téléchargement de l'APK / Скачать APK

**➡️ [Releases → Télécharger la dernière version APK](../../releases/latest)**

---

## 🎯 Concept

France Pour Tous est une application pédagogique mobile conçue pour les russophones qui souhaitent comprendre l'âme, l'histoire, l'organisation et les codes sociaux de la France.

**Principe clé :** Un bouton **🇫🇷 / 🇷🇺 Toggle** permet de basculer instantanément entre le français et le russe sur n'importe quel écran.

---

## ✨ Fonctionnalités

| Fonctionnalité | Description |
|---|---|
| 🔄 **Toggle FR/RU** | Bascule instantanée français ↔ russe sur tout l'app |
| 📚 **50 Leçons** | 10 modules × 5 leçons couvrant 6 thèmes chacune |
| 📝 **Quiz interactifs** | 5 questions par leçon avec corrections et explications |
| 🤝 **Conseil d'Ami** | Encadré bilingue sur les codes sociaux implicites |
| 📊 **Dashboard** | Progression détaillée, scores, séries d'apprentissage |
| 📖 **Glossaire** | Tous les termes des leçons complétées, recherchable |
| 🆘 **Urgences** | Numéros essentiels + liens officiels (Ameli, CAF…) |

---

## 🏗️ Structure du Projet

```
france-pour-tous/
├── .github/
│   └── workflows/
│       └── build.yml              # CI/CD GitHub Actions → APK automatique
│
├── assets/
│   ├── lang/
│   │   ├── fr.json                # Chaînes UI en français
│   │   └── ru.json                # Chaînes UI en russe
│   └── lessons/
│       ├── module_1/
│       │   ├── lesson_1.json      # ✅ Leçon pilote complète et rédigée
│       │   ├── lesson_2.json      # Structure complète, contenu à enrichir
│       │   └── ...
│       └── module_10/
│           └── lesson_5.json
│
├── lib/
│   ├── main.dart                  # Point d'entrée
│   ├── app.dart                   # Root widget + thème
│   ├── theme/
│   │   └── app_theme.dart         # Design system (couleurs FR, typographie)
│   ├── services/
│   │   ├── language_service.dart  # 🔑 Moteur du toggle FR/RU
│   │   ├── progress_service.dart  # Suivi progression + scores
│   │   └── content_service.dart   # Chargement JSON + catalogue modules
│   ├── widgets/
│   │   └── language_toggle.dart   # Widget bouton FR/RU animé
│   └── screens/
│       ├── splash_screen.dart     # Écran de démarrage + MainShell
│       ├── home_screen.dart       # Grille des 10 modules
│       ├── module_screen.dart     # Liste des 5 leçons d'un module
│       ├── lesson_screen.dart     # Lecture leçon (6 thèmes + Conseil d'Ami)
│       ├── quiz_screen.dart       # Quiz interactif + résultats
│       ├── dashboard_screen.dart  # Dashboard progression
│       ├── glossary_screen.dart   # Glossaire thématique + recherche
│       └── urgences_screen.dart   # Urgences + liens utiles
│
└── pubspec.yaml
```

---

## 📋 Plan des 50 Leçons / План 50 уроков

### Module 1 🏛️ — Les Racines de la France / Корни Франции
| # | FR | RU |
|---|---|---|
| 1 | **Naître Français — L'âme d'un peuple** ⭐ *(leçon pilote complète)* | **Стать французом — душа народа** |
| 2 | De Clovis à la Révolution | От Хлодвига до Революции |
| 3 | La Révolution et ses héritages | Революция и её наследие |
| 4 | Guerres mondiales et Résistance | Мировые войны и Сопротивление |
| 5 | La France dans l'Europe et le monde | Франция в Европе и мире |

### Module 2 🗺️ — Paris et ses Régions / Париж и регионы
| # | FR | RU |
|---|---|---|
| 1 | Paris, la Capitale | Париж — столица |
| 2 | Nord, Normandie et Grand Est | Север, Нормандия и Гран-Эст |
| 3 | Sud-Ouest : Bordeaux, Toulouse | Юго-Запад: Бордо, Тулуза |
| 4 | Provence, Côte d'Azur et Corse | Прованс, Лазурный берег и Корсика |
| 5 | La France d'Outre-Mer | Заморские территории Франции |

### Module 3 ⚖️ — La République et l'État / Республика и государство
| # | FR | RU |
|---|---|---|
| 1 | La Constitution et les Institutions | Конституция и институты |
| 2 | Voter et Élire en France | Голосование и выборы во Франции |
| 3 | Communes, Départements, Régions | Коммуны, департаменты, регионы |
| 4 | La Laïcité au Quotidien | Светскость в повседневной жизни |
| 5 | Police, Justice et Droits | Полиция, правосудие и права |

### Module 4 🤝 — Les Codes Sociaux Invisibles / Невидимые социальные коды
| # | FR | RU |
|---|---|---|
| 1 | Bonjour, Politesse et Codes de Base | Bonjour, вежливость и базовые коды |
| 2 | À Table : Codes et Rituels | За столом: коды и ритуалы |
| 3 | L'Art du Débat à la Française | Искусство французской дискуссии |
| 4 | L'Argent : Le Grand Tabou | Деньги: великое табу |
| 5 | Chez Soi : Vie Privée Sacrée | Домашний очаг: священная частная жизнь |

### Module 5 💼 — Travailler en France / Работа во Франции
| # | FR | RU |
|---|---|---|
| 1 | Trouver et Décrocher un Emploi | Найти и получить работу |
| 2 | 35h, Congés et Droits des Salariés | 35 часов, отпуск и права работников |
| 3 | Les Grandes Entreprises Françaises | Крупные французские компании |
| 4 | Commerce et Vie Économique | Торговля и экономическая жизнь |
| 5 | Créer son Entreprise en France | Открыть бизнес во Франции |

### Module 6 🏥 — Santé, École et Services Publics / Здравоохранение и госуслуги
| # | FR | RU |
|---|---|---|
| 1 | Le Système de Santé Français | Французская система здравоохранения |
| 2 | L'École de la Maternelle au Bac | Школа от детсада до бакалавра |
| 3 | Université et Grandes Écoles | Университет и Grandes Écoles |
| 4 | Mairie, Préfecture et Démarches | Мэрия, префектура и формальности |
| 5 | CAF, Pôle Emploi et Aides Sociales | CAF, Pôle Emploi и социальная помощь |

### Module 7 🥖 — La Gastronomie Française / Французская гастрономия
| # | FR | RU |
|---|---|---|
| 1 | Le Pain, Symbole Culturel | Хлеб — культурный символ |
| 2 | Les 1000 Fromages de France | 1000 сыров Франции |
| 3 | La Culture du Vin | Культура вина |
| 4 | Plats Emblématiques Régionaux | Культовые региональные блюда |
| 5 | Café, Apéro et Art du Repas | Кофе, аперитив и искусство трапезы |

### Module 8 🎨 — Arts & Littérature / Искусство и литература
| # | FR | RU |
|---|---|---|
| 1 | Impressionnisme et Peinture Française | Импрессионизм и французская живопись |
| 2 | Architecture : Cathédrales et Modernité | Архитектура: соборы и современность |
| 3 | Les Grands Auteurs Français | Великие французские авторы |
| 4 | Théâtre et Danse | Театр и танец |
| 5 | La Chanson Française | Французская песня |

### Module 9 🎬 — Cinéma & Télévision / Кино и телевидение
| # | FR | RU |
|---|---|---|
| 1 | Les Frères Lumière et le Cinéma | Братья Люмьер и история кино |
| 2 | La Nouvelle Vague | Новая волна |
| 3 | Cannes et les Césars | Канны и Сезар |
| 4 | Télévision Française | Французское телевидение |
| 5 | Jeux Vidéo, BD et Culture Pop | Видеоигры, комиксы и поп-культура |

### Module 10 🌍 — La France Diverse et Mondiale / Разнообразная и глобальная Франция
| # | FR | RU |
|---|---|---|
| 1 | La France, Terre d'Immigration | Франция — земля иммиграции |
| 2 | La Francophonie Mondiale | Мировая франкофония |
| 3 | S'Intégrer : Droits et Naturalisation | Интеграция: права и натурализация |
| 4 | Religions et Laïcité au Pluriel | Религии и светскость на практике |
| 5 | Comprendre l'Examen de Naturalisation | Подготовка к экзамену на натурализацию |

---

## 🔧 Format JSON des Leçons / Формат JSON уроков

Chaque fichier `lesson_N.json` suit cette structure bilingue :

```json
{
  "meta": {
    "module_id": 1,
    "lesson_id": 1,
    "lesson_icon": "🌱",
    "estimated_minutes": 15,
    "difficulty": "débutant"
  },
  "fr": {
    "lesson_title": "Titre en français",
    "intro": "Introduction...",
    "sections": [
      {
        "theme": "Histoire",
        "icon": "📜",
        "title": "Titre de section",
        "body": "Contenu avec **gras** supporté..."
      }
      // 6 sections : Histoire, Région, Politique, Économie, Culture, Gastronomie
    ],
    "conseil_ami": {
      "title": "Le Conseil d'Ami 🤝",
      "content": "Code social implicite pour un russophone..."
    },
    "glossary": [
      { "term": "La laïcité", "definition": "Séparation Église/État..." }
    ],
    "quiz": [
      {
        "question": "Question ?",
        "options": ["A", "B", "C", "D"],
        "correct_index": 1,
        "explanation": "Explication pédagogique..."
      }
    ]
  },
  "ru": {
    // Même structure en russe
  }
}
```

---

## 🚀 Installation et Développement / Установка и разработка

### Prérequis
- Flutter 3.22+ (`flutter --version`)
- Java 17+
- Android SDK

### Lancer en développement
```bash
git clone https://github.com/YOUR_USERNAME/france-pour-tous.git
cd france-pour-tous
flutter pub get
flutter run
```

### Build APK manuel
```bash
flutter build apk --debug    # Debug APK
flutter build apk --release  # Release APK (non signé)
```

---

## 🤖 GitHub Actions — APK Automatique

À chaque `push` sur `main`, GitHub Actions :
1. Installe Flutter 3.22
2. Build le Debug APK et le Release APK
3. Attache les APK en **Artifacts** de workflow
4. Crée une **Release GitHub** avec l'APK téléchargeable

**→ Aller dans [Actions](../../actions) ou [Releases](../../releases) pour télécharger l'APK**

---

## 🧩 Architecture Technique

```
LanguageService (Provider)          ProgressService (Provider)
       │                                    │
       │ isFrench/toggle()                  │ markCompleted() / saveScore()
       │                                    │
       ▼                                    ▼
ContentService ──────────────────► Screens (Consumer<>)
  loadLesson(moduleId, lessonId)    HomeScreen
  modules[] catalog                 LessonScreen
                                    QuizScreen
                                    DashboardScreen
                                    GlossaryScreen
                                    UrgencesScreen
```

**Toggle FR/RU :** `LanguageService.toggle()` recharge instantanément les chaînes JSON correspondantes et notifie tous les `Consumer<LanguageService>` via le pattern Provider → reconstruction immédiate de tout l'UI.

---

## 📝 Enrichir le Contenu / Enrichir les leçons

Pour rédiger une leçon complète, éditez le fichier JSON correspondant :
```
assets/lessons/module_X/lesson_Y.json
```

Chaque leçon doit impérativement couvrir les **6 thèmes** :
1. `Histoire` — Contexte historique
2. `Région` — Particularités géographiques  
3. `Politique & Social` — Institutions et valeurs
4. `Économie & Vie quotidienne` — Aspects pratiques (Carte Vitale, école, travail)
5. `Culture artistique` — Cinéma, musique, arts
6. `Gastronomie & Codes sociaux` — Table, étiquette, **Conseil d'Ami**

---

## 📚 Sources Officielles

- [vie-publique.fr](https://www.vie-publique.fr) — Institutions et loi
- [service-public.fr](https://www.service-public.fr) — Démarches administratives
- [ameli.fr](https://www.ameli.fr) — Assurance Maladie
- [education.gouv.fr](https://www.education.gouv.fr) — Système scolaire
- [culture.gouv.fr](https://www.culture.gouv.fr) — Culture française

---

## 📄 Licence

MIT — Libre d'utilisation, de modification et de redistribution.

---

*Fait avec ❤️ pour faciliter l'intégration des russophones en France.*  
*Сделано с ❤️ для облегчения интеграции русскоязычных во Франции.*
