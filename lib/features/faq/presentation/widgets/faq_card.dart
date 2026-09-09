import 'package:flutter/material.dart';
import 'package:switchboard/core/utils/url_helper.dart';
import 'package:switchboard/features/faq/data/models/faq.dart';

class FaqCard extends StatefulWidget {
  final Faq faq;
  final int index;

  const FaqCard({
    super.key,
    required this.faq,
    required this.index,
  });

  @override
  State<FaqCard> createState() => _FaqCardState();
}

class _FaqCardState extends State<FaqCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 1.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colorScheme.outlineVariant.withAlpha(80),
          width: 1.0,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Theme(
        // Remove default dividers from ExpansionTile
        data: theme.copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          onExpansionChanged: (expanded) {
            setState(() {
              _isExpanded = expanded;
            });
          },
          tilePadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          childrenPadding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 16.0,
          ),
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _isExpanded
                  ? colorScheme.primary.withAlpha(30)
                  : colorScheme.primaryContainer.withAlpha(120),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.help_outline_rounded,
              size: 20,
              color: colorScheme.primary,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withAlpha(20),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'QUESTION #${widget.index + 1}',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.faq.question ?? '',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
            ],
          ),
          children: [
            const Divider(height: 1),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHigh.withAlpha(100),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                widget.faq.response ?? '',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.45,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton.filledTonal(
                  tooltip: 'Share Question & Answer',
                  onPressed: _shareFaq,
                  icon: const Icon(Icons.share_outlined, size: 18),
                  style: IconButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _shareFaq() {
    String subject = 'FAQ - ${widget.faq.question ?? ''}';
    String body =
        'Q: ${widget.faq.question ?? ''}\n\nA: ${widget.faq.response ?? ''}\n\nShared via Switchboard App';

    UrlHelper.sendEmail(subject, body);
  }
}
