import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switchboard/core/router/nav_scaffold.dart';
import 'package:switchboard/core/utils/fa_helper.dart';
import 'package:switchboard/core/utils/url_helper.dart';
import 'package:switchboard/features/home/presentation/widgets/ace_card.dart';

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({super.key});

  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Assistance'),
        elevation: 0,
        actions: buildAppBarActions(context, showEmergency: false),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              children: [
                // 911 Urgent Notice Banner
                _buildUrgentBanner(context, colorScheme),

                const SizedBox(height: 16),

                // Military Crisis Line Card
                _buildEmergencyHelplineCard(
                  context,
                  title: 'Military Crisis Line',
                  subtitle: '988 Suicide & Crisis Lifeline (Press 1)',
                  description:
                      'Free, confidential 24/7 support for Service Members, Veterans, and their loved ones in crisis.',
                  badgeIcon: FontAwesomeIcons.heartPulse,
                  badgeColor: Colors.red.shade700,
                  phone: '8002738255',
                  phoneLabel: 'Call 988 (Press 1)',
                  sms: '838255',
                  smsLabel: 'Text 838255',
                  webUrl: 'https://www.veteranscrisisline.net',
                  webLabel: 'Web Chat',
                ),

                const SizedBox(height: 16),

                // RAINN (National Sexual Assault Hotline - Non-DoD)
                _buildEmergencyHelplineCard(
                  context,
                  title: 'RAINN',
                  subtitle: 'National Sexual Assault Hotline (Non-DoD)',
                  description:
                      '24/7, confidential support for sexual assault victims and survivors, completely independent of DoD reporting channels.',
                  badgeIcon: FontAwesomeIcons.shieldHeart,
                  badgeColor: Colors.deepPurple.shade700,
                  phone: '8006564673',
                  phoneLabel: 'Call 800-656-4673',
                  sms: '8006564673',
                  smsLabel: 'Text 800-656-4673',
                  webUrl: 'https://rainn.org/help-and-healing/hotline/',
                  webLabel: 'RAINN.org',
                  signalUrl: 'https://signal.me/#p/+18006564673',
                  signalLabel: 'Signal Chat',
                ),

                const SizedBox(height: 16),

                // DoD Safe Helpline (Sexual Assault Help)
                _buildEmergencyHelplineCard(
                  context,
                  title: 'DoD Safe Helpline',
                  subtitle: 'Sexual Assault Response & Support',
                  description:
                      '24/7, confidential, anonymous sexual assault response and victim advocacy created specifically for the DoD community.',
                  badgeIcon: FaHelper.getIconFromName('ribbon'),
                  badgeColor: Colors.teal.shade700,
                  phone: '8779955247',
                  phoneLabel: 'Call 877-995-5247',
                  sms: '8779955247',
                  smsLabel: 'Text 877-995-5247',
                  webUrl: 'https://www.safehelpline.org',
                  webLabel: 'SafeHelpline.org',
                ),


                const SizedBox(height: 20),

                // Suicide Intervention Reminder Card (ACE Model)
                const AceCard(),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUrgentBanner(BuildContext context, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: Colors.red.withAlpha(20),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.red.withAlpha(100)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.warning_amber_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Immediate Life-Threatening Danger',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'If you or someone else is in immediate danger, call 911 or go to the nearest Emergency Room.',
                  style: TextStyle(
                    fontSize: 12.5,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmergencyHelplineCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String description,
    required dynamic badgeIcon,
    required Color badgeColor,
    required String phone,
    required String phoneLabel,
    String? sms,
    String? smsLabel,
    String? webUrl,
    String? webLabel,
    String? signalUrl,
    String? signalLabel,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: badgeColor.withAlpha(80), width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: badgeColor.withAlpha(30),
                    shape: BoxShape.circle,
                  ),
                  child: _buildBadgeIcon(badgeIcon, badgeColor, 24),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: badgeColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              description,
              style: TextStyle(
                fontSize: 13.5,
                height: 1.4,
                color: colorScheme.onSurfaceVariant,
              ),
            ),

            const SizedBox(height: 16),
            const Divider(height: 1),
            const SizedBox(height: 14),

            // Action Buttons Row (Call, SMS, Web, Signal)
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                FilledButton.icon(
                  onPressed: () => UrlHelper.makePhoneCall(phone),
                  icon: const Icon(Icons.phone, size: 18),
                  label: Text(phoneLabel),
                  style: FilledButton.styleFrom(
                    backgroundColor: badgeColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                ),
                if (sms != null)
                  OutlinedButton.icon(
                    onPressed: () => UrlHelper.textMessage(sms),
                    icon: const Icon(Icons.sms_outlined, size: 18),
                    label: Text(smsLabel ?? 'Text Support'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: badgeColor,
                      side: BorderSide(color: badgeColor),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                    ),
                  ),
                if (webUrl != null)
                  OutlinedButton.icon(
                    onPressed: () => UrlHelper.launchBrowser(webUrl),
                    icon: const Icon(Icons.language_outlined, size: 18),
                    label: Text(webLabel ?? 'Website'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: colorScheme.onSurface,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                    ),
                  ),
                if (signalUrl != null)
                  OutlinedButton.icon(
                    onPressed: () => UrlHelper.launchBrowser(signalUrl),
                    icon: const Icon(Icons.chat_bubble_outline, size: 18),
                    label: Text(signalLabel ?? 'Signal Chat'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: badgeColor,
                      side: BorderSide(color: badgeColor),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildBadgeIcon(dynamic icon, Color color, double size) {
    if (icon is IconData) {
      return Icon(icon, color: color, size: size);
    }
    return FaIcon(icon, color: color, size: size);
  }
}


