import 'package:flutter/material.dart';
import 'package:switchboard/core/router/nav_scaffold.dart';
import 'package:switchboard/core/utils/url_helper.dart';
import 'package:switchboard/features/guides/data/models/guide.dart';

class GuideDetailPage extends StatefulWidget {
  const GuideDetailPage({super.key, required this.guide});

  final Guide guide;

  @override
  State<GuideDetailPage> createState() => _GuideDetailPageState();
}

class _GuideDetailPageState extends State<GuideDetailPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Guide'),
        elevation: 0,
        actions: [
          ...buildAppBarActions(context),
          if (widget.guide.urlLink != null &&
              widget.guide.urlLink!.isNotEmpty)
            IconButton(
              tooltip: 'Open PDF Guide',
              onPressed: () {
                UrlHelper.launchBrowser(widget.guide.urlLink!);
              },
              icon: const Icon(Icons.picture_as_pdf_outlined),
            ),
          IconButton(
            tooltip: 'Share Guide',
            icon: Icon(
              theme.platform == TargetPlatform.iOS
                  ? Icons.ios_share
                  : Icons.share_outlined,
            ),
            onPressed: _shareGuide,
          ),
        ],
      ),

      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              children: [
                // Header Badge & Title
                _buildHeader(context, theme, colorScheme),

                const SizedBox(height: 16),

                // Main Description Hero Callout Box
                if (widget.guide.description != null &&
                    widget.guide.description!.isNotEmpty)
                  _buildDescriptionBox(context, theme, colorScheme),

                const SizedBox(height: 24),

                // Quick Action Bar (PDF Link & Share)
                _buildActionBar(context, colorScheme),

                const SizedBox(height: 28),

                // Structured Content Sections
                if (widget.guide.stress != null &&
                    widget.guide.stress!.isNotEmpty) ...[
                  _buildSection(
                    context,
                    title: 'Sources of Stress Include:',
                    content: widget.guide.stress!,
                    icon: Icons.warning_amber_rounded,
                    iconColor: Colors.amber.shade800,
                  ),
                  const SizedBox(height: 24),
                ],

                if (widget.guide.signs != null &&
                    widget.guide.signs!.isNotEmpty) ...[
                  _buildSection(
                    context,
                    title: 'Signs Wingmen Should Know / Look For',
                    content: widget.guide.signs!,
                    icon: Icons.visibility_outlined,
                    iconColor: Colors.blue.shade700,
                  ),
                  const SizedBox(height: 24),
                ],

                if (widget.guide.deployment != null &&
                    widget.guide.deployment!.isNotEmpty) ...[
                  _buildSection(
                    context,
                    title: 'Deployment Considerations',
                    content: widget.guide.deployment!,
                    icon: Icons.flight_takeoff_outlined,
                    iconColor: Colors.teal.shade700,
                  ),
                  const SizedBox(height: 24),
                ],

                if (widget.guide.riskFactors != null &&
                    widget.guide.riskFactors!.isNotEmpty) ...[
                  _buildSection(
                    context,
                    title:
                        'Recognizing Distress in Individuals with Risk Factors',
                    content: widget.guide.riskFactors!,
                    icon: Icons.error_outline_rounded,
                    iconColor: Colors.deepOrange,
                  ),
                  const SizedBox(height: 24),
                ],

                if (widget.guide.vigilance != null &&
                    widget.guide.vigilance!.isNotEmpty) ...[
                  _buildSection(
                    context,
                    title: 'Vigilance Reminders',
                    content: widget.guide.vigilance!,
                    icon: Icons.report_problem_outlined,
                    iconColor: Colors.orange.shade900,
                  ),
                  const SizedBox(height: 24),
                ],

                if (widget.guide.action != null &&
                    widget.guide.action!.isNotEmpty) ...[
                  _buildSection(
                    context,
                    title: 'Recommended Wingman Action',
                    content: widget.guide.action!,
                    icon: Icons.handshake_outlined,
                    iconColor: Colors.green.shade700,
                  ),
                  const SizedBox(height: 24),
                ],

                if (widget.guide.assistance != null &&
                    widget.guide.assistance!.isNotEmpty) ...[
                  _buildImmediateAssistanceBox(
                    context,
                    theme,
                    colorScheme,
                    content: widget.guide.assistance!,
                  ),
                  const SizedBox(height: 24),
                ],

                if (widget.guide.considerations != null &&
                    widget.guide.considerations!.isNotEmpty) ...[
                  _buildSection(
                    context,
                    title: 'Leadership Considerations',
                    content: widget.guide.considerations!,
                    icon: Icons.supervisor_account_outlined,
                    iconColor: Colors.purple.shade700,
                  ),
                  const SizedBox(height: 24),
                ],

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: colorScheme.primary.withAlpha(25),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'RESILIENCE QUICK GUIDE',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                  color: colorScheme.primary,
                ),
              ),
            ),
            if (widget.guide.subtitle != null &&
                widget.guide.subtitle!.isNotEmpty) ...[
              const SizedBox(width: 8),
              Text(
                '• ${widget.guide.subtitle!}',
                style: TextStyle(
                  fontSize: 12,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 10),
        Text(
          widget.guide.name ?? 'Guide Detail',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
            height: 1.25,
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionBox(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer.withAlpha(70),
        borderRadius: BorderRadius.circular(16),
        border: Border(
          left: BorderSide(
            color: colorScheme.primary,
            width: 4,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                size: 20,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'Overview',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            widget.guide.description!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.5,
              fontSize: 14.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionBar(BuildContext context, ColorScheme colorScheme) {
    final hasPdf =
        widget.guide.urlLink != null && widget.guide.urlLink!.isNotEmpty;

    return Row(
      children: [
        if (hasPdf)
          FilledButton.tonalIcon(
            onPressed: () {
              UrlHelper.launchBrowser(widget.guide.urlLink!);
            },
            icon: const Icon(Icons.picture_as_pdf, size: 18),
            label: const Text('Open PDF Guide'),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
          ),
        if (hasPdf) const SizedBox(width: 12),
        OutlinedButton.icon(
          onPressed: _shareGuide,
          icon: const Icon(Icons.share_outlined, size: 18),
          label: const Text('Share Guide'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
        ),
      ],
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required String content,
    required IconData icon,
    required Color iconColor,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withAlpha(25),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                size: 20,
                color: iconColor,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Text(
            content,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.5,
              fontSize: 14.5,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Divider(height: 1, color: colorScheme.outlineVariant.withAlpha(60)),
      ],
    );
  }

  Widget _buildImmediateAssistanceBox(
    BuildContext context,
    ThemeData theme,
    ColorScheme colorScheme, {
    required String content,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: Colors.red.withAlpha(20),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.red.withAlpha(120),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.medical_services,
                  size: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Seek Immediate Mental Health Assistance:',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface,
              height: 1.5,
              fontSize: 14.5,
            ),
          ),
        ],
      ),
    );
  }

  void _shareGuide() {
    String subject = 'Resilience Quick Guide - ${widget.guide.name ?? ''}';
    String body = widget.guide.name ?? '';
    body += '\n\n';
    body += widget.guide.description ?? '';

    if (widget.guide.stress != null && widget.guide.stress!.isNotEmpty) {
      body += '\n\nSources of stress include:\n${widget.guide.stress!}';
    }

    if (widget.guide.signs != null && widget.guide.signs!.isNotEmpty) {
      body +=
          '\n\nSigns Wingmen Should Know/Look For:\n${widget.guide.signs!}';
    }

    if (widget.guide.deployment != null &&
        widget.guide.deployment!.isNotEmpty) {
      body += '\n\nDeployment:\n${widget.guide.deployment!}';
    }

    if (widget.guide.riskFactors != null &&
        widget.guide.riskFactors!.isNotEmpty) {
      body +=
          '\n\nRecognizing Distress in Individuals with Risk Factors:\n${widget.guide.riskFactors!}';
    }

    if (widget.guide.vigilance != null && widget.guide.vigilance!.isNotEmpty) {
      body += '\n\nVigilance Reminders:\n${widget.guide.vigilance!}';
    }

    if (widget.guide.action != null && widget.guide.action!.isNotEmpty) {
      body += '\n\nRecommended Wingman Action:\n${widget.guide.action!}';
    }

    if (widget.guide.assistance != null &&
        widget.guide.assistance!.isNotEmpty) {
      body +=
          '\n\nSeek Immediate Assistance:\n${widget.guide.assistance!}';
    }

    if (widget.guide.considerations != null &&
        widget.guide.considerations!.isNotEmpty) {
      body +=
          '\n\nLeadership Considerations:\n${widget.guide.considerations!}';
    }

    if (widget.guide.urlLink != null && widget.guide.urlLink!.isNotEmpty) {
      body += '\n\nPDF Guide: ${widget.guide.urlLink!}';
    }

    UrlHelper.sendEmail(subject, body);
  }
}
