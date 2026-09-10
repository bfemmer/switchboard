import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switchboard/core/utils/url_helper.dart';
import 'package:switchboard/features/units/data/models/unit.dart';

class UnitCard extends StatefulWidget {
  const UnitCard({required this.unit, super.key});

  final Unit unit;

  @override
  State<UnitCard> createState() => _UnitCardState();
}

class _UnitCardState extends State<UnitCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final hasLink = widget.unit.link != null && widget.unit.link!.isNotEmpty;
    final hasFacebook =
        widget.unit.facebook != null && widget.unit.facebook!.isNotEmpty;

    return Card(
      elevation: 1.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colorScheme.outlineVariant.withAlpha(80),
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header Row: USAF Roundel Avatar + Badges & Unit Name
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
                    width: 34,
                    height: 34,
                    child: Image.asset(
                      'assets/images/usaf_roundel.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.account_balance,
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
                      Row(
                        children: [
                          if (widget.unit.state != null &&
                              widget.unit.state!.isNotEmpty)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.primary.withAlpha(20),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                widget.unit.state!.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.primary,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          if (widget.unit.parent != null &&
                              widget.unit.parent!.isNotEmpty) ...[
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.secondary.withAlpha(20),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                widget.unit.parent!.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: colorScheme.secondary,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.unit.name ?? 'AFRC Unit',
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

            // Base Location Section
            if (widget.unit.base != null && widget.unit.base!.isNotEmpty) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      widget.unit.base!,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 14),
            Divider(
              height: 1,
              color: colorScheme.outlineVariant.withAlpha(60),
            ),
            const SizedBox(height: 8),

            // Action Buttons Row
            Row(
              children: [
                if (hasLink)
                  FilledButton.tonalIcon(
                    onPressed: () {
                      UrlHelper.launchBrowser(widget.unit.link!);
                    },
                    icon: const Icon(Icons.open_in_new, size: 15),
                    label: const Text('Visit Website'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      textStyle: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                      ),
                      visualDensity: VisualDensity.compact,
                    ),
                  )
                else
                  const Spacer(),

                if (hasLink) const Spacer(),

                if (hasFacebook)
                  IconButton(
                    tooltip: 'Facebook Page',
                    onPressed: () {
                      UrlHelper.launchBrowser(widget.unit.facebook!);
                    },
                    icon: const FaIcon(FontAwesomeIcons.facebook, size: 18),
                    color: const Color(0xFF1877F2), // Official Facebook Blue
                  ),

                IconButton(
                  tooltip: 'Share Unit',
                  onPressed: _shareUnit,
                  icon: Icon(
                    Icons.share_outlined,
                    size: 20,
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _shareUnit() {
    String subject = 'AFRC Unit - ${widget.unit.name ?? ''}';
    String body = '${widget.unit.name ?? ''}\n';

    if (widget.unit.base != null && widget.unit.base!.isNotEmpty) {
      body += 'Location: ${widget.unit.base!}\n';
    }

    if (widget.unit.parent != null && widget.unit.parent!.isNotEmpty) {
      body += 'Organization: ${widget.unit.parent!}\n';
    }

    if (widget.unit.link != null && widget.unit.link!.isNotEmpty) {
      body += '\nWebsite: ${widget.unit.link!}';
    }

    if (widget.unit.facebook != null && widget.unit.facebook!.isNotEmpty) {
      body += '\nFacebook: ${widget.unit.facebook!}';
    }

    UrlHelper.sendEmail(subject, body);
  }
}
