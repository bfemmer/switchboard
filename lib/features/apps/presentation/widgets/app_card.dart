import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switchboard/core/utils/url_helper.dart';
import 'package:switchboard/features/apps/data/models/app.dart';

class AppCard extends StatefulWidget {
  final App app;

  const AppCard({super.key, required this.app});

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final hasApple =
        widget.app.applestore != null && widget.app.applestore!.isNotEmpty;
    final hasPlay =
        widget.app.playstore != null && widget.app.playstore!.isNotEmpty;
    final hasDescription =
        widget.app.description != null && widget.app.description!.isNotEmpty;

    final isIOS = theme.platform == TargetPlatform.iOS;
    final showApple = isIOS ? hasApple : (!hasPlay && hasApple);
    final showPlay = !isIOS ? hasPlay : (!hasApple && hasPlay);

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
            // Header Row: App Icon + Organization & App Name
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: 48,
                    height: 48,
                    child: widget.app.icon != null && widget.app.icon!.isNotEmpty
                        ? Image.asset(
                            'assets/images/${widget.app.icon!}',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: colorScheme.primaryContainer,
                              child: Icon(
                                Icons.apps,
                                color: colorScheme.primary,
                                size: 28,
                              ),
                            ),
                          )
                        : Container(
                            color: colorScheme.primaryContainer,
                            child: Icon(
                              Icons.apps,
                              color: colorScheme.primary,
                              size: 28,
                            ),
                          ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.app.organization != null &&
                          widget.app.organization!.isNotEmpty)
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
                              widget.app.organization!.toUpperCase(),
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
                        widget.app.name ?? 'App',
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

            // Description Body
            if (hasDescription) ...[
              const SizedBox(height: 12),
              Text(
                widget.app.description!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.45,
                ),
              ),
            ],

            const SizedBox(height: 14),
            Divider(
              height: 1,
              color: colorScheme.outlineVariant.withAlpha(60),
            ),
            const SizedBox(height: 8),

            // Actions Footer Row: Single Store Link & Share Button
            Row(
              children: [
                if (showApple)
                  FilledButton.tonalIcon(
                    onPressed: () {
                      UrlHelper.launchBrowser(widget.app.applestore!);
                    },
                    icon: const FaIcon(FontAwesomeIcons.apple, size: 15),
                    label: const Text('Visit App Store'),
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
                else if (showPlay)
                  FilledButton.tonalIcon(
                    onPressed: () {
                      UrlHelper.launchBrowser(widget.app.playstore!);
                    },
                    icon: const FaIcon(FontAwesomeIcons.googlePlay, size: 13),
                    label: const Text('Visit Google Play Store'),
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
                  ),

                const Spacer(),

                IconButton(
                  tooltip: 'Share App',
                  onPressed: _shareApp,
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

  void _shareApp() {
    String subject = 'Recommended App - ${widget.app.name ?? ''}';
    String body = '${widget.app.name ?? ''}\n';

    if (widget.app.organization != null &&
        widget.app.organization!.isNotEmpty) {
      body += 'Developer: ${widget.app.organization!}\n';
    }

    if (widget.app.description != null &&
        widget.app.description!.isNotEmpty) {
      body += '\n${widget.app.description!}\n';
    }

    if (widget.app.applestore != null && widget.app.applestore!.isNotEmpty) {
      body += '\nApple App Store: ${widget.app.applestore!}';
    }

    if (widget.app.playstore != null && widget.app.playstore!.isNotEmpty) {
      body += '\nGoogle Play Store: ${widget.app.playstore!}';
    }

    UrlHelper.sendEmail(subject, body);
  }
}
