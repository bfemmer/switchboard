import 'package:flutter/material.dart';
import 'package:switchboard/features/guides/data/models/guide.dart';
import 'package:switchboard/features/guides/presentation/views/guide_detail_page.dart';

class GuideCard extends StatelessWidget {
  final Guide guide;

  const GuideCard({super.key, required this.guide});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final hasPdf = guide.urlLink != null && guide.urlLink!.isNotEmpty;

    return Card(
      elevation: 1.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colorScheme.outlineVariant.withAlpha(80),
          width: 1.0,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GuideDetailPage(guide: guide),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row: Thumbnail Avatar + Category Badge & Title
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer.withAlpha(120),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: Image.asset(
                        'assets/images/resilience.png',
                        fit: BoxFit.contain,
                        color: theme.brightness == Brightness.dark
                            ? Colors.white
                            : null,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.menu_book,
                          color: colorScheme.primary,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (guide.subtitle != null &&
                            guide.subtitle!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.primary.withAlpha(20),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                guide.subtitle!.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.primary,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        Text(
                          guide.name ?? 'Resilience Guide',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            height: 1.25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Description Snippet
              if (guide.description != null && guide.description!.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  guide.description!,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],

              const SizedBox(height: 14),
              Divider(
                height: 1,
                color: colorScheme.outlineVariant.withAlpha(60),
              ),
              const SizedBox(height: 10),

              // Card Footer Action Hint
              Row(
                children: [
                  Text(
                    'Read Guide',
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 14,
                    color: colorScheme.primary,
                  ),
                  const Spacer(),
                  if (hasPdf)
                    Tooltip(
                      message: 'PDF Available',
                      child: Icon(
                        Icons.picture_as_pdf,
                        size: 16,
                        color: Colors.red.shade700,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
