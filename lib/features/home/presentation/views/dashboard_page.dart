import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:switchboard/core/router/nav_scaffold.dart';
import 'package:switchboard/core/utils/url_helper.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static String route() => "/home";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Switchboard'),
        elevation: 0,
        actions: buildAppBarActions(context),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20.0,
              ),
              children: [
                // Hero / Banner Section
                _buildHeroBanner(context, colorScheme),

                const SizedBox(height: 20),

                // Privacy & Safety Shield Card
                _buildPrivacySafetyCard(context, colorScheme),

                const SizedBox(height: 24),

                // Introduction & About Card
                _buildIntroCard(context, theme, colorScheme),

                const SizedBox(height: 24),

                // Quick Navigation Grid
                _buildQuickNavigationHeader(context, theme),
                const SizedBox(height: 12),
                _buildQuickNavGrid(context, colorScheme),

                const SizedBox(height: 28),

                // Featured Quick Tools
                _buildSectionTitle(
                  context,
                  'Featured Resources',
                  Icons.star_outline,
                ),
                const SizedBox(height: 12),
                _buildFeaturedTools(context, colorScheme),

                const SizedBox(height: 28),

                // Switchboard By The Numbers
                _buildSectionTitle(
                  context,
                  'Switchboard At A Glance',
                  Icons.analytics_outlined,
                ),
                const SizedBox(height: 12),
                _buildStatsSummary(context, colorScheme),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroBanner(BuildContext context, ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primaryContainer,
            colorScheme.surfaceContainerHigh,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withAlpha(40),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'RESILIENCE & SUPPORT HUB',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Switchboard',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Quick, confidential access to support services, crisis hotlines, guides, and unit resources.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              width: 90,
              height: 90,
              child: Image.asset(
                'assets/images/resilience.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.shield_outlined,
                  size: 60,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrivacySafetyCard(
    BuildContext context,
    ColorScheme colorScheme,
  ) {
    return Card(
      elevation: 2,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(16),
      //   side: BorderSide(color: Colors.teal.withAlpha(120), width: 1.5),
      // ),
      // color: Colors.teal.withAlpha(15),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.teal.withAlpha(40),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.security_outlined,
                    color: Colors.teal,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '100% Private & Anonymous',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      Text(
                        'Your safety and privacy are strictly guaranteed.',
                        style: TextStyle(
                          fontSize: 13,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 24, thickness: 1),
            _buildPrivacyFeatureRow(
              context,
              icon: Icons.no_accounts_outlined,
              title: 'Zero Data Collection or User Logging',
              description:
                  'Switchboard does NOT log, capture, track, or store any personal data, searches, phone calls, or usage statistics.',
            ),
            const SizedBox(height: 12),
            _buildPrivacyFeatureRow(
              context,
              icon: Icons.lock_outline,
              title: 'No Sign-In or Accounts Required',
              description:
                  'Access all emergency helplines, support guides, and unit directories completely anonymously.',
            ),
            const SizedBox(height: 12),
            _buildPrivacyFeatureRow(
              context,
              icon: Icons.phonelink_setup_outlined,
              title: 'Local & Offline First Architecture',
              description:
                  'Resource directories are stored locally on your device for instant access even without cellular connectivity.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivacyFeatureRow(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.teal),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12.5,
                  color: colorScheme.onSurfaceVariant,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIntroCard(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Card(
      elevation: 1.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info_outline, color: colorScheme.primary),
                const SizedBox(width: 10),
                Text(
                  'What is Switchboard?',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Switchboard provides service members, reservists, military families, and leaders with a single, easy-to-navigate resilience reference library.',
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.4),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildTagChip(context, 'Military Crisis Line', Colors.red),
                _buildTagChip(context, 'Sexual Assault Helpline', Colors.teal),
                _buildTagChip(context, 'Family Advocacy Program', Colors.blue),
                _buildTagChip(context, 'Reserve Units', Colors.indigo),
                _buildTagChip(context, 'Resilience Guides', Colors.purple),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTagChip(BuildContext context, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withAlpha(70)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }

  Widget _buildQuickNavigationHeader(BuildContext context, ThemeData theme) {
    return _buildSectionTitle(
      context,
      'Explore App Features',
      Icons.grid_view_rounded,
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title, IconData icon) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, size: 22, color: theme.colorScheme.primary),
        const SizedBox(width: 10),
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickNavGrid(BuildContext context, ColorScheme colorScheme) {
    final items = [
      _QuickNavItem(
        title: 'Hotlines',
        subtitle: 'Confidential Support Lines',
        faIcon: FontAwesomeIcons.phone,
        iconColor: Colors.teal,
        onTap: () => context.push('/hotlines'),
      ),
      _QuickNavItem(
        title: 'Categories',
        subtitle: 'Browse by Subject',
        icon: Icons.category,
        iconColor: Colors.indigo,
        onTap: () => context.push('/categories'),
      ),
      _QuickNavItem(
        title: 'Videos',
        subtitle: 'FAP & Resilience Media',
        icon: Icons.play_circle_fill,
        iconColor: Colors.amber.shade800,
        onTap: () => context.push('/videos'),
      ),
      _QuickNavItem(
        title: 'Leadership Guides',
        subtitle: 'Resilience Quick Guides',
        icon: Icons.menu_book,
        iconColor: Colors.purple,
        onTap: () => context.push('/guides'),
      ),
      _QuickNavItem(
        title: 'Helpful Apps',
        subtitle: 'Recommended Mobile Apps',
        icon: Icons.apps,
        iconColor: Colors.blue,
        onTap: () => context.push('/apps'),
      ),
      _QuickNavItem(
        title: 'Resilience Skills',
        subtitle: 'Coping Strategies',
        icon: Icons.psychology,
        iconColor: Colors.deepOrange,
        onTap: () => context.push('/skills'),
      ),
      _QuickNavItem(
        title: 'Reserve Units',
        subtitle: 'AFRC Units Directory',
        icon: Icons.account_balance,
        iconColor: Colors.teal.shade700,
        onTap: () => context.push('/units'),
      ),
      _QuickNavItem(
        title: 'FAQs',
        subtitle: 'Frequently Asked Questions',
        icon: Icons.help_outline,
        iconColor: Colors.blueGrey,
        onTap: () => context.push('/faqs'),
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 2;
        if (constraints.maxWidth > 700) {
          crossAxisCount = 3;
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 2.3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              elevation: 1.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: item.onTap,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: item.iconColor.withAlpha(30),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: item.faIcon != null
                            ? FaIcon(
                                item.faIcon,
                                color: item.iconColor,
                                size: 20,
                              )
                            : Icon(item.icon, color: item.iconColor, size: 22),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.5,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              item.subtitle,
                              style: TextStyle(
                                fontSize: 11,
                                color: colorScheme.onSurfaceVariant,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildFeaturedTools(BuildContext context, ColorScheme colorScheme) {
    return Column(
      children: [
        _buildFeaturedCard(
          context,
          title: 'Connect the Network Guide',
          subtitle: 'AFRC / A1Z Printable Guide',
          description:
              'Printable comprehensive guide of resources (the original source and inspiration for this app).',
          image: 'assets/images/network_alpha.png',
          onTap: () => UrlHelper.launchBrowser(
            'https://billfemmer.gitlab.io/switchboard-support/Connect_the_Network_Guide_March2025.pdf',
          ),
        ),
        const SizedBox(height: 12),
        _buildFeaturedCard(
          context,
          title: 'DAVA Locator',
          subtitle: 'Domestic Abuse Victim Advocate',
          description:
              'Locate your nearest DAVA who can help explain options, assess risk, and develop safety plans.',
          image: 'assets/images/dava.png',
          onTap: () => UrlHelper.launchBrowser(
            'https://www.militaryonesource.mil/resources/tools/domestic-abuse-victim-advocate-locator',
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String description,
    required String image,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 1.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 55,
                  height: 55,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.picture_as_pdf,
                      size: 36,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.5,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 11.5,
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: colorScheme.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatsSummary(BuildContext context, ColorScheme colorScheme) {
    final stats = [
      _StatItem('100+', 'Resources'),
      _StatItem('51', 'Units'),
      _StatItem('26', 'Guides'),
      _StatItem('14', 'Hotlines'),
      _StatItem('14', 'Apps'),
      _StatItem('8', 'Skills'),
    ];

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: stats.map((stat) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Text(
                      stat.value,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      stat.label,
                      style: TextStyle(
                        fontSize: 12,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _QuickNavItem {
  final String title;
  final String subtitle;
  final IconData? icon;
  final FaIconData? faIcon;
  final Color iconColor;
  final VoidCallback onTap;

  _QuickNavItem({
    required this.title,
    required this.subtitle,
    this.icon,
    this.faIcon,
    required this.iconColor,
    required this.onTap,
  });
}

class _StatItem {
  final String value;
  final String label;

  _StatItem(this.value, this.label);
}
