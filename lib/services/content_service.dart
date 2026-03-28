import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Color;
import 'package:flutter/services.dart';

class ModuleInfo {
  final int id;
  final String iconEmoji;
  final List<Color>? gradient; // handled in theme
  final Map<String, String> titles;     // {'fr': '...', 'ru': '...'}
  final Map<String, String> subtitles;
  final Map<String, String> descriptions;
  final List<LessonInfo> lessons;

  const ModuleInfo({
    required this.id,
    required this.iconEmoji,
    required this.titles,
    required this.subtitles,
    required this.descriptions,
    required this.lessons,
    this.gradient,
  });
}

class LessonInfo {
  final int moduleId;
  final int lessonId;
  final String iconEmoji;
  final Map<String, String> titles;
  final Map<String, String> subtitles;
  final int estimatedMinutes;

  const LessonInfo({
    required this.moduleId,
    required this.lessonId,
    required this.iconEmoji,
    required this.titles,
    required this.subtitles,
    required this.estimatedMinutes,
  });
}

class ContentService {
  final Map<String, Map<String, dynamic>> _lessonCache = {};
  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  // ── MODULE CATALOG (titles in FR/RU) ──────────────────────────
  static const List<ModuleInfo> modules = [
    ModuleInfo(
      id: 1, iconEmoji: '🏛️',
      titles: {'fr': 'Les Racines de la France', 'ru': 'Корни Франции'},
      subtitles: {'fr': 'Histoire & Identité', 'ru': 'История и идентичность'},
      descriptions: {
        'fr': 'De la Gaule à la Ve République — les grandes étapes qui ont forgé la France.',
        'ru': 'От Галлии до Пятой республики — ключевые этапы, создавшие Францию.'
      },
      lessons: [
        LessonInfo(moduleId:1, lessonId:1, iconEmoji:'🌱',
          titles:{'fr':'Naître Français — L\'âme d\'un peuple','ru':'Стать французом — душа народа'},
          subtitles:{'fr':'Histoire, valeurs et codes fondateurs','ru':'История, ценности и основы'}, estimatedMinutes:15),
        LessonInfo(moduleId:1, lessonId:2, iconEmoji:'⚔️',
          titles:{'fr':'De Clovis à la Révolution','ru':'От Хлодвига до Революции'},
          subtitles:{'fr':'Mille ans de monarchie','ru':'Тысяча лет монархии'}, estimatedMinutes:12),
        LessonInfo(moduleId:1, lessonId:3, iconEmoji:'🗽',
          titles:{'fr':'La Révolution et ses héritages','ru':'Революция и её наследие'},
          subtitles:{'fr':'1789, année zéro de la modernité','ru':'1789 — нулевой год современности'}, estimatedMinutes:12),
        LessonInfo(moduleId:1, lessonId:4, iconEmoji:'🎖️',
          titles:{'fr':'Guerres mondiales et Résistance','ru':'Мировые войны и Сопротивление'},
          subtitles:{'fr':'Le XXe siècle tragique et fondateur','ru':'Трагический и основополагающий XX век'}, estimatedMinutes:12),
        LessonInfo(moduleId:1, lessonId:5, iconEmoji:'🇪🇺',
          titles:{'fr':'La France dans l\'Europe et le monde','ru':'Франция в Европе и мире'},
          subtitles:{'fr':'De De Gaulle à Macron','ru':'От де Голля до Макрона'}, estimatedMinutes:10),
      ],
    ),
    ModuleInfo(
      id: 2, iconEmoji: '🗺️',
      titles: {'fr': 'Paris et ses Régions', 'ru': 'Париж и регионы'},
      subtitles: {'fr': 'Géographie & Identités locales', 'ru': 'География и местная идентичность'},
      descriptions: {
        'fr': 'Paris, les 13 régions, l\'outre-mer — la France aux mille visages.',
        'ru': 'Париж, 13 регионов, заморские территории — Франция тысячи лиц.'
      },
      lessons: [
        LessonInfo(moduleId:2, lessonId:1, iconEmoji:'🗼',
          titles:{'fr':'Paris, la Capitale','ru':'Париж, столица'},
          subtitles:{'fr':'Histoire et géographie de Paris','ru':'История и география Парижа'}, estimatedMinutes:12),
        LessonInfo(moduleId:2, lessonId:2, iconEmoji:'🏔️',
          titles:{'fr':'Nord, Normandie et Grand Est','ru':'Север, Нормандия и Гран-Эст'},
          subtitles:{'fr':'La France atlantique et rhénane','ru':'Атлантическая и рейнская Франция'}, estimatedMinutes:10),
        LessonInfo(moduleId:2, lessonId:3, iconEmoji:'🌊',
          titles:{'fr':'Sud-Ouest : Bordeaux, Toulouse, Pays Basque','ru':'Юго-Запад: Бордо, Тулуза, Страна Басков'},
          subtitles:{'fr':'Vignes, Airbus et fierté régionale','ru':'Виноградники, Airbus и региональная гордость'}, estimatedMinutes:10),
        LessonInfo(moduleId:2, lessonId:4, iconEmoji:'☀️',
          titles:{'fr':'Provence, Côte d\'Azur et Corse','ru':'Прованс, Лазурный берег и Корсика'},
          subtitles:{'fr':'La Méditerranée française','ru':'Французское Средиземноморье'}, estimatedMinutes:10),
        LessonInfo(moduleId:2, lessonId:5, iconEmoji:'🌴',
          titles:{'fr':'La France d\'Outre-Mer','ru':'Заморские территории Франции'},
          subtitles:{'fr':'Antilles, Guyane, Réunion, Pacifique','ru':'Антилы, Гвиана, Реюньон, Тихий океан'}, estimatedMinutes:10),
      ],
    ),
    ModuleInfo(
      id: 3, iconEmoji: '⚖️',
      titles: {'fr': 'La République et l\'État', 'ru': 'Республика и государство'},
      subtitles: {'fr': 'Institutions & Laïcité', 'ru': 'Институты и светскость'},
      descriptions: {
        'fr': 'Comment fonctionne la Ve République — Président, Parlement, communes.',
        'ru': 'Как работает Пятая республика — Президент, Парламент, коммуны.'
      },
      lessons: [
        LessonInfo(moduleId:3, lessonId:1, iconEmoji:'📜',
          titles:{'fr':'La Constitution et les Institutions','ru':'Конституция и институты'},
          subtitles:{'fr':'Les 3 pouvoirs expliqués','ru':'Три ветви власти'}, estimatedMinutes:12),
        LessonInfo(moduleId:3, lessonId:2, iconEmoji:'🗳️',
          titles:{'fr':'Voter et Élire en France','ru':'Голосование и выборы во Франции'},
          subtitles:{'fr':'Suffrage universel et vie démocratique','ru':'Всеобщее избирательное право'}, estimatedMinutes:10),
        LessonInfo(moduleId:3, lessonId:3, iconEmoji:'🏘️',
          titles:{'fr':'Communes, Départements, Régions','ru':'Коммуны, департаменты, регионы'},
          subtitles:{'fr':'La décentralisation expliquée','ru':'Децентрализация простыми словами'}, estimatedMinutes:10),
        LessonInfo(moduleId:3, lessonId:4, iconEmoji:'🕌',
          titles:{'fr':'La Laïcité au Quotidien','ru':'Светскость в повседневной жизни'},
          subtitles:{'fr':'Religion, État et espace public','ru':'Религия, государство и публичное пространство'}, estimatedMinutes:12),
        LessonInfo(moduleId:3, lessonId:5, iconEmoji:'👮',
          titles:{'fr':'Police, Justice et Droits','ru':'Полиция, правосудие и права'},
          subtitles:{'fr':'Comment la loi s\'applique','ru':'Как применяется закон'}, estimatedMinutes:10),
      ],
    ),
    ModuleInfo(
      id: 4, iconEmoji: '🤝',
      titles: {'fr': 'Les Codes Sociaux Invisibles', 'ru': 'Невидимые социальные коды'},
      subtitles: {'fr': 'Étiquette & Art de Vivre', 'ru': 'Этикет и искусство жить'},
      descriptions: {
        'fr': 'Ce que les Français ne vous expliqueront jamais — les règles non-dites.',
        'ru': 'То, что французы никогда не объяснят — негласные правила.'
      },
      lessons: [
        LessonInfo(moduleId:4, lessonId:1, iconEmoji:'👋',
          titles:{'fr':'Bonjour, Politesse et Codes de Base','ru':'«Бонжур», вежливость и базовые коды'},
          subtitles:{'fr':'Les règles invisibles de la relation sociale','ru':'Невидимые правила общения'}, estimatedMinutes:10),
        LessonInfo(moduleId:4, lessonId:2, iconEmoji:'🍽️',
          titles:{'fr':'À Table : Codes et Rituels','ru':'За столом: коды и ритуалы'},
          subtitles:{'fr':'Le repas français comme cérémonie','ru':'Французская трапеза как церемония'}, estimatedMinutes:12),
        LessonInfo(moduleId:4, lessonId:3, iconEmoji:'💬',
          titles:{'fr':'L\'Art du Débat à la Française','ru':'Искусство французской дискуссии'},
          subtitles:{'fr':'Pourquoi les Français adorent argumenter','ru':'Почему французы любят спорить'}, estimatedMinutes:10),
        LessonInfo(moduleId:4, lessonId:4, iconEmoji:'💰',
          titles:{'fr':'L\'Argent : Le Grand Tabou','ru':'Деньги: великое табу'},
          subtitles:{'fr':'Ne jamais parler salaire en société','ru':'Никогда не говорить о зарплате в обществе'}, estimatedMinutes:10),
        LessonInfo(moduleId:4, lessonId:5, iconEmoji:'🏠',
          titles:{'fr':'Chez Soi : Vie Privée Sacrée','ru':'Домашний очаг: священная частная жизнь'},
          subtitles:{'fr':'Pourquoi les Français n\'invitent pas facilement','ru':'Почему французы нечасто зовут в гости'}, estimatedMinutes:10),
      ],
    ),
    ModuleInfo(
      id: 5, iconEmoji: '💼',
      titles: {'fr': 'Travailler en France', 'ru': 'Работа во Франции'},
      subtitles: {'fr': 'Emploi, Droits & Entreprises', 'ru': 'Занятость, права и предприятия'},
      descriptions: {
        'fr': 'CDI, SMIC, syndicats, entretien d\'embauche — tout sur le monde du travail.',
        'ru': 'CDI, SMIC, профсоюзы, собеседование — всё о мире труда.'
      },
      lessons: [
        LessonInfo(moduleId:5, lessonId:1, iconEmoji:'📋',
          titles:{'fr':'Trouver et Décrocher un Emploi','ru':'Найти и получить работу'},
          subtitles:{'fr':'CV, lettre de motivation, entretien','ru':'Резюме, мотивационное письмо, собеседование'}, estimatedMinutes:12),
        LessonInfo(moduleId:5, lessonId:2, iconEmoji:'⏰',
          titles:{'fr':'35h, Congés et Droits des Salariés','ru':'35 часов, отпуск и права работников'},
          subtitles:{'fr':'Le code du travail expliqué simplement','ru':'Трудовой кодекс просто'}, estimatedMinutes:10),
        LessonInfo(moduleId:5, lessonId:3, iconEmoji:'🏭',
          titles:{'fr':'Les Grandes Entreprises Françaises','ru':'Крупные французские компании'},
          subtitles:{'fr':'CAC 40, Airbus, LVMH, Carrefour...','ru':'CAC 40, Airbus, LVMH, Carrefour...'}, estimatedMinutes:10),
        LessonInfo(moduleId:5, lessonId:4, iconEmoji:'🛍️',
          titles:{'fr':'Commerce et Vie Économique','ru':'Торговля и экономическая жизнь'},
          subtitles:{'fr':'Marchés, supermarchés, soldes','ru':'Рынки, супермаркеты, распродажи'}, estimatedMinutes:10),
        LessonInfo(moduleId:5, lessonId:5, iconEmoji:'💡',
          titles:{'fr':'Créer son Entreprise en France','ru':'Открыть бизнес во Франции'},
          subtitles:{'fr':'Auto-entrepreneur, SARL, aides','ru':'Авто-предприниматель, помощь государства'}, estimatedMinutes:10),
      ],
    ),
    ModuleInfo(
      id: 6, iconEmoji: '🏥',
      titles: {'fr': 'Santé, École et Services Publics', 'ru': 'Здравоохранение, школа и госуслуги'},
      subtitles: {'fr': 'Services à la personne', 'ru': 'Публичные услуги'},
      descriptions: {
        'fr': 'Carte Vitale, école de la maternelle au bac, CAF, Pôle Emploi — mode d\'emploi.',
        'ru': 'Carte Vitale, школа от детсада до бакалавра, CAF, Pôle Emploi — инструкция.'
      },
      lessons: [
        LessonInfo(moduleId:6, lessonId:1, iconEmoji:'💊',
          titles:{'fr':'Le Système de Santé Français','ru':'Французская система здравоохранения'},
          subtitles:{'fr':'Carte Vitale, médecin traitant, urgences','ru':'Carte Vitale, лечащий врач, скорая'}, estimatedMinutes:15),
        LessonInfo(moduleId:6, lessonId:2, iconEmoji:'📚',
          titles:{'fr':'L\'École de la Maternelle au Bac','ru':'Школа от детсада до бакалавра'},
          subtitles:{'fr':'Organisation de l\'Éducation Nationale','ru':'Организация народного образования'}, estimatedMinutes:12),
        LessonInfo(moduleId:6, lessonId:3, iconEmoji:'🎓',
          titles:{'fr':'Université et Grandes Écoles','ru':'Университет и Grandes Écoles'},
          subtitles:{'fr':'Le système d\'enseignement supérieur','ru':'Система высшего образования'}, estimatedMinutes:10),
        LessonInfo(moduleId:6, lessonId:4, iconEmoji:'🏛️',
          titles:{'fr':'Mairie, Préfecture et Démarches','ru':'Мэрия, префектура и формальности'},
          subtitles:{'fr':'Comment faire ses papiers en France','ru':'Как оформить документы во Франции'}, estimatedMinutes:12),
        LessonInfo(moduleId:6, lessonId:5, iconEmoji:'👨‍👩‍👧',
          titles:{'fr':'CAF, Pôle Emploi et Aides Sociales','ru':'CAF, Pôle Emploi и социальная помощь'},
          subtitles:{'fr':'Les aides auxquelles vous avez droit','ru':'Помощь, на которую вы имеете право'}, estimatedMinutes:12),
      ],
    ),
    ModuleInfo(
      id: 7, iconEmoji: '🥖',
      titles: {'fr': 'La Gastronomie Française', 'ru': 'Французская гастрономия'},
      subtitles: {'fr': 'Patrimoine UNESCO & Art de Table', 'ru': 'Наследие ЮНЕСКО и искусство стола'},
      descriptions: {
        'fr': 'Pain, fromage, vin et recettes emblématiques — la culture culinaire française.',
        'ru': 'Хлеб, сыр, вино и культовые рецепты — французская кулинарная культура.'
      },
      lessons: [
        LessonInfo(moduleId:7, lessonId:1, iconEmoji:'🥐',
          titles:{'fr':'Le Pain, Symbole Culturel','ru':'Хлеб — культурный символ'},
          subtitles:{'fr':'Du boulanger quotidien au pain sacré','ru':'От ежедневного хлебника до священного хлеба'}, estimatedMinutes:10),
        LessonInfo(moduleId:7, lessonId:2, iconEmoji:'🧀',
          titles:{'fr':'Les 1000 Fromages de France','ru':'1000 сыров Франции'},
          subtitles:{'fr':'Camembert, Roquefort, Comté, AOP','ru':'Камамбер, Рокфор, Конте, AOP'}, estimatedMinutes:10),
        LessonInfo(moduleId:7, lessonId:3, iconEmoji:'🍷',
          titles:{'fr':'La Culture du Vin','ru':'Культура вина'},
          subtitles:{'fr':'Bordeaux, Bourgogne, Champagne','ru':'Бордо, Бургундия, Шампань'}, estimatedMinutes:10),
        LessonInfo(moduleId:7, lessonId:4, iconEmoji:'👨‍🍳',
          titles:{'fr':'Plats Emblématiques Régionaux','ru':'Культовые региональные блюда'},
          subtitles:{'fr':'Bouillabaisse, cassoulet, raclette...','ru':'Буйабес, кассуле, раклет...'}, estimatedMinutes:12),
        LessonInfo(moduleId:7, lessonId:5, iconEmoji:'☕',
          titles:{'fr':'Café, Apéro et Art du Repas','ru':'Кофе, аперитив и искусство трапезы'},
          subtitles:{'fr':'Les rituels autour de la nourriture','ru':'Ритуалы вокруг еды'}, estimatedMinutes:10),
      ],
    ),
    ModuleInfo(
      id: 8, iconEmoji: '🎨',
      titles: {'fr': 'Arts & Littérature', 'ru': 'Искусство и литература'},
      subtitles: {'fr': 'Peinture, Architecture & Lettres', 'ru': 'Живопись, архитектура и словесность'},
      descriptions: {
        'fr': 'Monet, Proust, Molière, la tour Eiffel — le génie artistique français.',
        'ru': 'Моне, Пруст, Мольер, Эйфелева башня — французский художественный гений.'
      },
      lessons: [
        LessonInfo(moduleId:8, lessonId:1, iconEmoji:'🖼️',
          titles:{'fr':'Impressionnisme et Peinture Française','ru':'Импрессионизм и французская живопись'},
          subtitles:{'fr':'Du Louvre à Pompidou','ru':'От Лувра до Помпиду'}, estimatedMinutes:12),
        LessonInfo(moduleId:8, lessonId:2, iconEmoji:'🏗️',
          titles:{'fr':'Architecture : Cathédrales, Haussmann, Le Corbusier','ru':'Архитектура: соборы, Осман, Ле Корбюзье'},
          subtitles:{'fr':'Styles et grandes réalisations','ru':'Стили и великие творения'}, estimatedMinutes:10),
        LessonInfo(moduleId:8, lessonId:3, iconEmoji:'📖',
          titles:{'fr':'Les Grands Auteurs Français','ru':'Великие французские авторы'},
          subtitles:{'fr':'Hugo, Zola, Proust, Camus, Beauvoir','ru':'Гюго, Золя, Пруст, Камю, Бовуар'}, estimatedMinutes:12),
        LessonInfo(moduleId:8, lessonId:4, iconEmoji:'🎭',
          titles:{'fr':'Théâtre et Danse','ru':'Театр и танец'},
          subtitles:{'fr':'Molière, l\'Opéra de Paris, la danse contemporaine','ru':'Мольер, Парижская опера, современный танец'}, estimatedMinutes:10),
        LessonInfo(moduleId:8, lessonId:5, iconEmoji:'🎵',
          titles:{'fr':'La Chanson Française','ru':'Французская песня'},
          subtitles:{'fr':'Piaf, Brel, Gainsbourg, jusqu\'à aujourd\'hui','ru':'Пиаф, Брель, Генсбур и сегодняшний день'}, estimatedMinutes:10),
      ],
    ),
    ModuleInfo(
      id: 9, iconEmoji: '🎬',
      titles: {'fr': 'Cinéma & Télévision', 'ru': 'Кино и телевидение'},
      subtitles: {'fr': 'De Lumière à Cannes', 'ru': 'От Люмьера до Канн'},
      descriptions: {
        'fr': 'L\'inventeur du cinéma, la Nouvelle Vague, les Césars, la TV publique.',
        'ru': 'Изобретатель кино, Новая волна, премия Сезар, общественное ТВ.'
      },
      lessons: [
        LessonInfo(moduleId:9, lessonId:1, iconEmoji:'📽️',
          titles:{'fr':'Les Frères Lumière et l\'Histoire du Cinéma','ru':'Братья Люмьер и история кино'},
          subtitles:{'fr':'Lyon 1895 — la naissance du 7ème Art','ru':'Лион 1895 — рождение 7-го искусства'}, estimatedMinutes:10),
        LessonInfo(moduleId:9, lessonId:2, iconEmoji:'🌊',
          titles:{'fr':'La Nouvelle Vague','ru':'Новая волна'},
          subtitles:{'fr':'Godard, Truffaut, Varda — révolution cinématographique','ru':'Годар, Трюффо, Варда — кинематографическая революция'}, estimatedMinutes:12),
        LessonInfo(moduleId:9, lessonId:3, iconEmoji:'🏆',
          titles:{'fr':'Cannes et les Césars','ru':'Канны и Сезар'},
          subtitles:{'fr':'Les grandes cérémonies du cinéma français','ru':'Главные церемонии французского кино'}, estimatedMinutes:10),
        LessonInfo(moduleId:9, lessonId:4, iconEmoji:'📺',
          titles:{'fr':'Télévision Française : Public et Privé','ru':'Французское телевидение: публичное и частное'},
          subtitles:{'fr':'TF1, France 2, Arte, CNews...','ru':'TF1, France 2, Arte, CNews...'}, estimatedMinutes:10),
        LessonInfo(moduleId:9, lessonId:5, iconEmoji:'🎮',
          titles:{'fr':'Jeux Vidéo, BD et Culture Populaire','ru':'Видеоигры, комиксы и поп-культура'},
          subtitles:{'fr':'Astérix, Tintin, Ubisoft, daft Punk','ru':'Астерикс, Тентен, Ubisoft, Daft Punk'}, estimatedMinutes:10),
      ],
    ),
    ModuleInfo(
      id: 10, iconEmoji: '🌍',
      titles: {'fr': 'La France Diverse et Mondiale', 'ru': 'Разнообразная и глобальная Франция'},
      subtitles: {'fr': 'Immigration, Diversité & Francophonie', 'ru': 'Иммиграция, разнообразие и франкофония'},
      descriptions: {
        'fr': 'Une nation d\'immigrants, la Francophonie mondiale, et s\'intégrer en France.',
        'ru': 'Нация иммигрантов, мировая франкофония и интеграция во Франции.'
      },
      lessons: [
        LessonInfo(moduleId:10, lessonId:1, iconEmoji:'🌏',
          titles:{'fr':'La France, Terre d\'Immigration','ru':'Франция — земля иммиграции'},
          subtitles:{'fr':'Histoire et réalité de l\'immigration','ru':'История и реальность иммиграции'}, estimatedMinutes:12),
        LessonInfo(moduleId:10, lessonId:2, iconEmoji:'🗣️',
          titles:{'fr':'La Francophonie : 300 Millions de Locuteurs','ru':'Франкофония: 300 миллионов носителей'},
          subtitles:{'fr':'Le français dans le monde','ru':'Французский язык в мире'}, estimatedMinutes:10),
        LessonInfo(moduleId:10, lessonId:3, iconEmoji:'🤲',
          titles:{'fr':'S\'Intégrer : Droits, Devoirs et Naturalisaton','ru':'Интеграция: права, обязанности и натурализация'},
          subtitles:{'fr':'Le chemin vers la citoyenneté','ru':'Путь к гражданству'}, estimatedMinutes:12),
        LessonInfo(moduleId:10, lessonId:4, iconEmoji:'🌺',
          titles:{'fr':'Islam, Judaïsme, Protestantisme et France','ru':'Ислам, иудаизм, протестантизм и Франция'},
          subtitles:{'fr':'Les minorités religieuses dans la République laïque','ru':'Религиозные меньшинства в светской республике'}, estimatedMinutes:10),
        LessonInfo(moduleId:10, lessonId:5, iconEmoji:'🏅',
          titles:{'fr':'Comprendre l\'Examen de Naturalisation','ru':'Понять экзамен на натурализацию'},
          subtitles:{'fr':'Histoire, institutions, valeurs — se préparer','ru':'История, институты, ценности — подготовиться'}, estimatedMinutes:15),
      ],
    ),
  ];

  Future<void> init() async {
    // Pre-load lesson 1 of module 1 as warmup
    await loadLesson(1, 1);
    _isLoaded = true;
  }

  Future<Map<String, dynamic>?> loadLesson(int moduleId, int lessonId) async {
    final cacheKey = '${moduleId}_$lessonId';
    if (_lessonCache.containsKey(cacheKey)) {
      return _lessonCache[cacheKey];
    }

    try {
      final path = 'assets/lessons/module_$moduleId/lesson_$lessonId.json';
      final jsonStr = await rootBundle.loadString(path);
      final data = json.decode(jsonStr) as Map<String, dynamic>;
      _lessonCache[cacheKey] = data;
      return data;
    } catch (e) {
      debugPrint('ContentService: failed to load module $moduleId lesson $lessonId: $e');
      return null;
    }
  }

  ModuleInfo? getModule(int moduleId) {
    try {
      return modules.firstWhere((m) => m.id == moduleId);
    } catch (_) {
      return null;
    }
  }

  LessonInfo? getLessonInfo(int moduleId, int lessonId) {
    final module = getModule(moduleId);
    if (module == null) return null;
    try {
      return module.lessons.firstWhere((l) => l.lessonId == lessonId);
    } catch (_) {
      return null;
    }
  }
}
