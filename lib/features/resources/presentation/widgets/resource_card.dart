import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switchboard/core/utils/fa_helper.dart';
import 'package:switchboard/core/utils/url_helper.dart';
import 'package:switchboard/features/resources/data/models/resource.dart';

class ResourceCard extends StatefulWidget {
  final Resource resource;

  const ResourceCard({super.key, required this.resource});

  @override
  State<ResourceCard> createState() => _ResourceCardState();
}

class _ResourceCardState extends State<ResourceCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final hasLink =
        widget.resource.link != null && widget.resource.link!.isNotEmpty;
    final hasVideo =
        widget.resource.video != null && widget.resource.video!.isNotEmpty;
    final hasVoice =
        widget.resource.voice != null && widget.resource.voice!.isNotEmpty;
    final hasSms =
        widget.resource.sms != null && widget.resource.sms!.isNotEmpty;
    final iconData = widget.resource.icon != null
        ? FaHelper.getIconFromName(widget.resource.icon!)
        : null;

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
            // Header Row: Avatar/Icon + Title & Type Badge
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer.withAlpha(120),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: iconData != null
                      ? FaIcon(
                          iconData,
                          size: 20,
                          color: colorScheme.primary,
                        )
                      : Icon(
                          Icons.grid_view_rounded,
                          size: 22,
                          color: colorScheme.primary,
                        ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.resource.type != null &&
                          widget.resource.type!.isNotEmpty)
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
                              widget.resource.type!.toUpperCase(),
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
                        widget.resource.name ?? 'Resource',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Description Body
            if (widget.resource.description != null &&
                widget.resource.description!.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                widget.resource.description!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.4,
                ),
              ),
            ],

            const SizedBox(height: 16),
            Divider(height: 1, color: colorScheme.outlineVariant.withAlpha(60)),
            const SizedBox(height: 8),

            // Actions Row
            Row(
              children: [
                if (hasLink)
                  FilledButton.tonalIcon(
                    onPressed: () {
                      UrlHelper.launchBrowser(widget.resource.link!);
                    },
                    icon: const Icon(Icons.open_in_new, size: 15),
                    label: const Text('Visit Site'),
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

                if (hasVideo)
                  IconButton(
                    tooltip: 'Watch Video',
                    onPressed: () {
                      UrlHelper.launchBrowser(widget.resource.video!);
                    },
                    icon: const FaIcon(FontAwesomeIcons.youtube, size: 18),
                    color: Colors.red.shade700,
                  ),

                if (hasVoice)
                  IconButton(
                    tooltip: 'Call Phone',
                    onPressed: () {
                      UrlHelper.makePhoneCall(widget.resource.voice!);
                    },
                    icon: const FaIcon(FontAwesomeIcons.phone, size: 16),
                    color: Colors.teal.shade700,
                  ),

                if (hasSms)
                  IconButton(
                    tooltip: 'Send SMS',
                    onPressed: () {
                      UrlHelper.textMessage(widget.resource.sms!);
                    },
                    icon: const FaIcon(FontAwesomeIcons.commentSms, size: 16),
                    color: Colors.blue.shade700,
                  ),

                IconButton(
                  tooltip: 'Share Resource',
                  onPressed: _shareResource,
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

  void _shareResource() {
    String subject = 'Resilience Resource - ${widget.resource.name ?? ''}';
    String body = '${widget.resource.description ?? ''}\n';

    if (widget.resource.link != null && widget.resource.link!.isNotEmpty) {
      body += '\nWeb: ${widget.resource.link!}';
    }

    if (widget.resource.video != null && widget.resource.video!.isNotEmpty) {
      body += '\nVideo: ${widget.resource.video!}';
    }

    if (widget.resource.voice != null && widget.resource.voice!.isNotEmpty) {
      body += '\nPhone: ${widget.resource.voice!}';
    }

    if (widget.resource.sms != null && widget.resource.sms!.isNotEmpty) {
      body += '\nText Message: ${widget.resource.sms!}';
    }

    UrlHelper.sendEmail(subject, body);
  }
}
