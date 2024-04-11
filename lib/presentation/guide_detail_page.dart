import 'package:flutter/material.dart';
import 'package:switchboard/presentation/widgets/info_card.dart';

import '../model/guide.dart';
import '../utility/url_helper.dart';

class GuideDetailPage extends StatefulWidget {
  const GuideDetailPage({super.key, required this.guide});

  final Guide guide;

  @override
  State<GuideDetailPage> createState() => _GuideDetailPageState();
}

class _GuideDetailPageState extends State<GuideDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Quick Guide'),
          actions: [
            IconButton(
              onPressed: () {
                UrlHelper.launchBrowser(widget.guide.urlLink!);
              },
              icon: const Icon(Icons.picture_as_pdf),
            ),
            IconButton(
              icon: Icon(
                Theme.of(context).platform == TargetPlatform.iOS
                    ? Icons.ios_share
                    : Icons.share,
              ),
              onPressed: () {
                String subject =
                    'Resilience Quick Guide - ${widget.guide.name!}';
                String body = widget.guide.name!;
                body += '\n\n';
                body += widget.guide.description!;

                if (widget.guide.stress != null) {
                  body += '\n\n';
                  body += 'Sources of stress include:\n';
                  body += widget.guide.stress!;
                }

                body += '\n\n';
                body += 'Signs Wingmen Should Know/Look For\n';
                body += widget.guide.signs!;

                if (widget.guide.deployment != null) {
                  body += '\n\n';
                  body += 'Deployment\n';
                  body += widget.guide.deployment!;
                }

                if (widget.guide.riskFactors != null) {
                  body += '\n\n';
                  body +=
                      'Recognizing Distress in Individuals with Risk Factors\n';
                  body += widget.guide.riskFactors!;
                }

                if (widget.guide.vigilance != null) {
                  body += '\n\n';
                  body +=
                      'In addition, wingmen must be vigilant when someone shows:\n';
                  body += widget.guide.vigilance!;
                }

                body += '\n\n';
                body += 'Recommended Wingman Action\n';
                body += widget.guide.action!;

                if (widget.guide.assistance != null) {
                  body += '\n\n';
                  body +=
                      'Seek immediate assistance from the Mental Health Clinic for any of the following:\n';
                  body += widget.guide.assistance!;
                }

                body += '\n\n';
                body += 'Leadership Considerations\n';
                body += widget.guide.considerations!;

                body += '\n\n';
                body += 'PDF File: ${widget.guide.urlLink}';

                UrlHelper.sendEmail(subject, body);
              },
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            InfoCard(
                title: widget.guide.name!,
                description: widget.guide.description!),
            if (widget.guide.stress != null)
              InfoCard(
                  title: 'Sources of stress include:',
                  description: widget.guide.stress!),
            InfoCard(
                title: 'Signs Wingmen Should Know/Look For',
                description: widget.guide.signs!),
            if (widget.guide.deployment != null)
              InfoCard(
                  title: 'Deployment', description: widget.guide.deployment!),
            if (widget.guide.riskFactors != null)
              InfoCard(
                  title:
                      'Recognizing Distress in Individuals with Risk Factors',
                  description: widget.guide.riskFactors!),
            if (widget.guide.vigilance != null)
              InfoCard(
                  title:
                      'In addition, wingmen must be vigilant when someone shows:',
                  description: widget.guide.vigilance!),
            InfoCard(
                title: 'Recommended Wingman Action',
                description: widget.guide.action!),
            if (widget.guide.assistance != null)
              InfoCard(
                  title:
                      'Seek immediate assistance from the Mental Health Clinic for any of the following:',
                  description: widget.guide.assistance!),
            InfoCard(
                title: 'Leadership Considerations',
                description: widget.guide.considerations!),
          ],
        )));
  }
}
