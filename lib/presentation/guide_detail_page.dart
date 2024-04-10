import 'package:flutter/material.dart';
import 'package:switchboard/presentation/widgets/info_card.dart';

import '../model/guide.dart';

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
                      'In addition, wingmen must be vigilant when someone shows: ',
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
