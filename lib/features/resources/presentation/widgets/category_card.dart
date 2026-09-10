import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:switchboard/core/utils/fa_helper.dart';
import 'package:switchboard/features/resources/data/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  static const List<Color> _categoryColors = [
    Colors.teal,
    Colors.indigo,
    Colors.purple,
    Colors.deepOrange,
    Colors.blue,
    Colors.amber,
    Colors.green,
    Colors.pink,
    Colors.deepPurple,
    Colors.blueGrey,
    Colors.cyan,
  ];

  Color _getCategoryColor(int? id, String? name) {
    if (id != null && id > 0) {
      return _categoryColors[(id - 1) % _categoryColors.length];
    }
    if (name != null && name.isNotEmpty) {
      return _categoryColors[name.codeUnitAt(0) % _categoryColors.length];
    }
    return Colors.teal;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final accentColor = _getCategoryColor(category.id, category.name);

    return Card(
      elevation: 1.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          if (category.id != null && category.name != null) {
            context.push(
              '/resourcesbycategory/${category.id.toString()}/${category.name!}',
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            children: [
              // Styled Icon Container
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: accentColor.withAlpha(28),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: FaIcon(
                  FaHelper.getIconFromName(category.icon ?? 'circleInfo'),
                  color: accentColor,
                  size: 22,
                ),
              ),

              const SizedBox(width: 14),

              // Title and Subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      category.name ?? 'Category',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Browse resources',
                      style: TextStyle(
                        fontSize: 12,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),

              // Trailing Chevron Indicator
              Icon(
                Icons.chevron_right,
                color: colorScheme.onSurfaceVariant.withAlpha(140),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
