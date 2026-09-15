import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switchboard/core/router/nav_scaffold.dart';
import 'package:switchboard/core/utils/loader.dart';
import 'package:switchboard/features/resources/presentation/viewmodels/resource_viewmodel.dart';
import 'package:switchboard/features/resources/presentation/widgets/responsive_resource_body.dart';

class HotlineListPage extends StatefulWidget {
  const HotlineListPage({super.key, required this.viewmodel});
  final ResourceViewModel viewmodel;
  static String route() => "/hotlines";

  @override
  HotlineListPageState createState() => HotlineListPageState();
}

class HotlineListPageState extends State<HotlineListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.viewmodel.loadHotlines.execute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotlines'),
        elevation: 0,
        actions: buildAppBarActions(context),
      ),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: widget.viewmodel.loadHotlines,
          builder: (context, _) {
            if (widget.viewmodel.loadHotlines.running) {
              return const Loader();
            }
            return ResponsiveResourceBody(
              resources: widget.viewmodel.resources,
              header: _buildHotlinesHeroBanner(context),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHotlinesHeroBanner(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

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
            color: Colors.black.withAlpha(15),
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
                    color: colorScheme.primary.withAlpha(35),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '24/7 CONFIDENTIAL SUPPORT LINES',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Confidential Hotlines',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Instant, 1-click access to crisis helplines, mental health support, family advocacy, and military assistance networks.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildFeatureChip(
                      context,
                      Icons.phone_forwarded,
                      '1-Click Dialing',
                      Colors.teal,
                    ),
                    _buildFeatureChip(
                      context,
                      Icons.sms_outlined,
                      'SMS & Text Support',
                      Colors.blue,
                    ),
                    _buildFeatureChip(
                      context,
                      Icons.language,
                      'Web & Chat Portals',
                      Colors.indigo,
                    ),
                    _buildFeatureChip(
                      context,
                      Icons.lock_outline,
                      '100% Anonymous',
                      Colors.purple,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.teal.withAlpha(25),
              shape: BoxShape.circle,
            ),
            child: const FaIcon(
              FontAwesomeIcons.phoneVolume,
              size: 44,
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureChip(
    BuildContext context,
    IconData icon,
    String label,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withAlpha(70)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

