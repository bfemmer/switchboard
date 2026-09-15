import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switchboard/features/guides/presentation/viewmodels/guide_viewmodel.dart';
import 'package:switchboard/features/guides/presentation/widgets/guide_card.dart';

class ResponsiveGuideBody extends StatelessWidget {
  final GuideViewModel viewmodel;

  const ResponsiveGuideBody({super.key, required this.viewmodel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: ListView(
          padding: const EdgeInsets.only(bottom: 30.0),
          children: [
            // 1. Quick Guides Hero Banner Card
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 12.0),
              child: _buildGuidesHeroBanner(context),
            ),

            // 2. Filter Bar
            Container(
              height: 54,
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHigh.withAlpha(80),
                border: Border(
                  top: BorderSide(
                    color: colorScheme.outlineVariant.withAlpha(60),
                    width: 1,
                  ),
                  bottom: BorderSide(
                    color: colorScheme.outlineVariant.withAlpha(60),
                    width: 1,
                  ),
                ),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 8.0,
                ),
                itemCount: viewmodel.filters.length,
                itemBuilder: (context, index) {
                  final category = viewmodel.filters[index];
                  final isSelected = category == viewmodel.selectedFilter;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: isSelected,
                      onSelected: (selected) {
                        if (selected) {
                          viewmodel.selectFilter(category);
                        }
                      },
                      selectedColor: colorScheme.primary,
                      labelStyle: TextStyle(
                        color: isSelected
                            ? colorScheme.onPrimary
                            : colorScheme.onSurfaceVariant,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.w500,
                        fontSize: 13,
                      ),
                      backgroundColor: colorScheme.surface,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: isSelected
                              ? Colors.transparent
                              : colorScheme.outlineVariant,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // 3. Responsive Grid
            viewmodel.filteredGuides.isEmpty && viewmodel.load.completed
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off_rounded,
                            size: 56,
                            color: colorScheme.onSurfaceVariant.withAlpha(100),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'No guides found for this category.',
                            style: TextStyle(
                              fontSize: 15,
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : LayoutBuilder(
                    builder: (context, constraints) {
                      int crossAxisCount = 1;
                      if (constraints.maxWidth >= 1000) {
                        crossAxisCount = 3;
                      } else if (constraints.maxWidth >= 600) {
                        crossAxisCount = 2;
                      }

                      return MasonryGridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: viewmodel.filteredGuides.length,
                        itemBuilder: (context, index) {
                          return GuideCard(
                            guide: viewmodel.filteredGuides[index],
                          );
                        },
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuidesHeroBanner(BuildContext context) {
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
                    'LEADERSHIP REFERENCE',
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
                  'Quick Guides',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Actionable resilience quick-reference guides for leaders, wingmen, commanders, and service members.',
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
                      Icons.rule_rounded,
                      'Action Summaries',
                      Colors.purple,
                    ),
                    _buildFeatureChip(
                      context,
                      Icons.picture_as_pdf_outlined,
                      'PDF Downloads',
                      Colors.red,
                    ),
                    _buildFeatureChip(
                      context,
                      Icons.handshake_outlined,
                      'Wingman Action',
                      Colors.teal,
                    ),
                    _buildFeatureChip(
                      context,
                      Icons.share_outlined,
                      'Easy Sharing',
                      Colors.indigo,
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
              color: Colors.purple.withAlpha(25),
              shape: BoxShape.circle,
            ),
            child: const FaIcon(
              FontAwesomeIcons.bookOpenReader,
              size: 44,
              color: Colors.purple,
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
