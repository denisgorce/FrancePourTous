import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/language_service.dart';
import '../theme/app_theme.dart';
import '../widgets/language_toggle.dart';

class UrgencesScreen extends StatelessWidget {
  const UrgencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.watch<LanguageService>();
    final isFr = lang.isFrench;

    return Scaffold(
      appBar: AppBar(
        title: Text(lang.t('urgences_title')),
        actions: [const LanguageToggle(), const SizedBox(width: 12)],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── EMERGENCY NUMBERS ────────────────────────────────────
            _SectionHeader(
              icon: '🚨',
              title: isFr ? 'Numéros d\'urgence' : 'Номера экстренных служб',
            ),
            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.6,
              children: [
                _EmergencyCard(
                  number: '15',
                  emoji: '🚑',
                  label: isFr ? 'SAMU\nUrgences médicales' : 'SAMU\nСкорая помощь',
                  color: AppTheme.rougeFrance,
                ),
                _EmergencyCard(
                  number: '17',
                  emoji: '👮',
                  label: isFr ? 'Police\nSécurité' : 'Полиция\nБезопасность',
                  color: AppTheme.bleuFrance,
                ),
                _EmergencyCard(
                  number: '18',
                  emoji: '🚒',
                  label: isFr ? 'Pompiers\nIncendie & secours' : 'Пожарные\nПожар и спасение',
                  color: const Color(0xFFFF6B35),
                ),
                _EmergencyCard(
                  number: '112',
                  emoji: '🇪🇺',
                  label: isFr ? 'Urgence\nEuropéenne' : 'Единый европейский\nномер',
                  color: const Color(0xFF003399),
                ),
              ],
            ),

            // Anti-poison & Crisis
            const SizedBox(height: 10),
            _HorizontalTile(
              number: '3114',
              emoji: '💬',
              label: isFr ? 'Numéro national de prévention du suicide' : 'Национальный номер профилактики суицида',
              color: const Color(0xFF7C3AED),
            ),
            _HorizontalTile(
              number: '3919',
              emoji: '🌸',
              label: isFr ? 'Violences femmes info (24h/24)' : 'Насилие в отношении женщин (круглосуточно)',
              color: const Color(0xFFE11D48),
            ),
            _HorizontalTile(
              number: '119',
              emoji: '👶',
              label: isFr ? 'Allô Enfance en Danger' : 'Детский телефон доверия',
              color: const Color(0xFF059669),
            ),

            const SizedBox(height: 24),

            // ── HEALTH ───────────────────────────────────────────────
            _SectionHeader(
              icon: '🏥',
              title: isFr ? 'Santé & Assurance Maladie' : 'Здравоохранение',
            ),
            const SizedBox(height: 10),

            _LinkCard(
              emoji: '💳',
              title: 'Ameli.fr',
              subtitle: isFr
                  ? 'Carte Vitale, remboursements, médecin traitant'
                  : 'Carte Vitale, возмещения, лечащий врач',
              url: 'ameli.fr',
              color: const Color(0xFF0057A8),
            ),
            _LinkCard(
              emoji: '🏥',
              title: 'Sante.fr',
              subtitle: isFr
                  ? 'Trouver un médecin, une pharmacie, un hôpital'
                  : 'Найти врача, аптеку, больницу',
              url: 'sante.fr',
              color: const Color(0xFF00A651),
            ),
            _LinkCard(
              emoji: '🧠',
              title: 'Doctolib.fr',
              subtitle: isFr
                  ? 'Prendre rendez-vous en ligne chez un médecin'
                  : 'Онлайн запись к врачу',
              url: 'doctolib.fr',
              color: const Color(0xFF3273F5),
            ),

            const SizedBox(height: 24),

            // ── ADMIN ────────────────────────────────────────────────
            _SectionHeader(
              icon: '🏛️',
              title: isFr ? 'Démarches Administratives' : 'Административные услуги',
            ),
            const SizedBox(height: 10),

            _LinkCard(
              emoji: '📋',
              title: 'Service-Public.fr',
              subtitle: isFr
                  ? 'Toutes vos démarches officielles en ligne'
                  : 'Все официальные госуслуги онлайн',
              url: 'service-public.fr',
              color: AppTheme.bleuFrance,
            ),
            _LinkCard(
              emoji: '📚',
              title: 'Vie-Publique.fr',
              subtitle: isFr
                  ? 'Comprendre les institutions et la loi'
                  : 'Понять институты и закон Франции',
              url: 'vie-publique.fr',
              color: const Color(0xFF3D5A80),
            ),
            _LinkCard(
              emoji: '🏠',
              title: isFr ? 'Logement social (HLM)' : 'Социальное жильё (HLM)',
              subtitle: isFr
                  ? 'Faire une demande de logement social'
                  : 'Подать заявку на социальное жильё',
              url: 'demande-logement-social.gouv.fr',
              color: const Color(0xFF6366F1),
            ),
            _LinkCard(
              emoji: '🏢',
              title: 'OFPRA',
              subtitle: isFr
                  ? 'Office français de protection des réfugiés'
                  : 'Офис защиты беженцев и лиц без гражданства',
              url: 'ofpra.gouv.fr',
              color: const Color(0xFFDC2626),
            ),

            const SizedBox(height: 24),

            // ── SOCIAL BENEFITS ──────────────────────────────────────
            _SectionHeader(
              icon: '💶',
              title: isFr ? 'Aides & Allocations' : 'Пособия и льготы',
            ),
            const SizedBox(height: 10),

            _LinkCard(
              emoji: '👨‍👩‍👧',
              title: 'CAF — Caf.fr',
              subtitle: isFr
                  ? 'APL (aide au logement), allocations familiales, RSA'
                  : 'Жилищная помощь, семейные и социальные пособия',
              url: 'caf.fr',
              color: const Color(0xFF2196F3),
            ),
            _LinkCard(
              emoji: '💼',
              title: 'France Travail',
              subtitle: isFr
                  ? 'Recherche d\'emploi, formation, allocations chômage'
                  : 'Поиск работы, обучение, пособие по безработице',
              url: 'francetravail.fr',
              color: const Color(0xFF00A699),
            ),
            _LinkCard(
              emoji: '🎓',
              title: 'Campus France',
              subtitle: isFr
                  ? 'Études supérieures pour étrangers en France'
                  : 'Высшее образование для иностранцев во Франции',
              url: 'campusfrance.org',
              color: const Color(0xFF8B1A4A),
            ),

            const SizedBox(height: 24),

            // ── KEY TIPS ─────────────────────────────────────────────
            _SectionHeader(
              icon: '💡',
              title: isFr ? 'Les 5 Réflexes Essentiels' : '5 главных шагов по приезде',
            ),
            const SizedBox(height: 10),

            ...[
              _Tip(
                step: '1',
                emoji: '💳',
                title: isFr ? 'Inscription Sécurité Sociale' : 'Регистрация в Sécurité Sociale',
                body: isFr
                    ? 'Inscrivez-vous sur ameli.fr pour obtenir votre numéro de Sécurité Sociale et commander votre Carte Vitale. C\'est la clé du système de santé.'
                    : 'Зарегистрируйтесь на ameli.fr для получения номера страхования и Carte Vitale. Это ключ ко всей системе здравоохранения.',
              ),
              _Tip(
                step: '2',
                emoji: '🏥',
                title: isFr ? 'Choisir un médecin traitant' : 'Выбрать лечащего врача',
                body: isFr
                    ? 'Choisissez un médecin de famille (médecin traitant) et déclarez-le sur ameli.fr. Sans lui, vos remboursements sont réduits.'
                    : 'Выберите семейного врача (médecin traitant) и задекларируйте его на ameli.fr. Без этого возмещения будут меньше.',
              ),
              _Tip(
                step: '3',
                emoji: '🏦',
                title: isFr ? 'Ouvrir un compte bancaire' : 'Открыть банковский счёт',
                body: isFr
                    ? 'Un compte bancaire est indispensable en France. En cas de refus, demandez le «droit au compte» à la Banque de France.'
                    : 'Банковский счёт необходим во Франции. При отказе запросите «право на счёт» в Banque de France.',
              ),
              _Tip(
                step: '4',
                emoji: '📋',
                title: isFr ? 'S\'inscrire en mairie' : 'Зарегистрироваться в мэрии',
                body: isFr
                    ? 'Déclarez votre adresse à la mairie pour les listes électorales (si vous avez la nationalité française) et pour recevoir les courriers officiels.'
                    : 'Зарегистрируйте адрес в мэрии для официальной переписки и избирательных списков (если вы гражданин Франции).',
              ),
              _Tip(
                step: '5',
                emoji: '🗣️',
                title: isFr ? 'Apprendre le français' : 'Учить французский',
                body: isFr
                    ? 'Des cours de français gratuits sont disponibles via Pôle Emploi (OFII pour les primo-arrivants) et des associations locales.'
                    : 'Бесплатные курсы французского доступны через France Travail, OFII (для недавно прибывших) и местные ассоциации.',
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─── WIDGETS ────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String icon;
  final String title;
  const _SectionHeader({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(icon, style: const TextStyle(fontSize: 20)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w800, color: AppTheme.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}

class _EmergencyCard extends StatelessWidget {
  final String number;
  final String emoji;
  final String label;
  final Color color;
  const _EmergencyCard({
    required this.number,
    required this.emoji,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number,
                style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.w900, color: color,
                ),
              ),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 10.5, color: AppTheme.textSecondary,
                  fontWeight: FontWeight.w600, height: 1.3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HorizontalTile extends StatelessWidget {
  final String number;
  final String emoji;
  final String label;
  final Color color;
  const _HorizontalTile({
    required this.number, required this.emoji,
    required this.label, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.07),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 22)),
          const SizedBox(width: 12),
          Text(
            number,
            style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w900, color: color,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 12.5, color: AppTheme.textSecondary, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class _LinkCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;
  final String url;
  final Color color;
  const _LinkCard({
    required this.emoji, required this.title, required this.subtitle,
    required this.url, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6, offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 42, height: 42,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text(emoji, style: const TextStyle(fontSize: 20))),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 11.5, color: AppTheme.textSecondary, height: 1.3),
                ),
                const SizedBox(height: 3),
                Text(
                  url,
                  style: TextStyle(fontSize: 10.5, color: color, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Icon(Icons.open_in_new, size: 16, color: color.withOpacity(0.6)),
        ],
      ),
    );
  }
}

class _Tip extends StatelessWidget {
  final String step;
  final String emoji;
  final String title;
  final String body;
  const _Tip({required this.step, required this.emoji, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F4FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.bleuFrance.withOpacity(0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28, height: 28,
            decoration: BoxDecoration(
              color: AppTheme.bleuFrance,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(step, style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w900, fontSize: 13,
              )),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(emoji, style: const TextStyle(fontSize: 16)),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.w700,
                          color: AppTheme.bleuFrance,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  body,
                  style: const TextStyle(
                    fontSize: 13, height: 1.5, color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
