import 'package:flutter/material.dart';
import 'package:switchboard/features/skills/data/models/skill.dart';
import 'package:switchboard/features/skills/presentation/widgets/skill_card.dart';

class SkillListMobileView extends StatefulWidget {
  const SkillListMobileView({required this.skills, super.key});

  final List<Skill> skills;

  @override
  State<SkillListMobileView> createState() => _SkillListMobileViewState();
}

class _SkillListMobileViewState extends State<SkillListMobileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(12.0),
          itemCount: widget.skills.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: SkillCard(skill: widget.skills[index]),
            );
          },
        ),
      ),
    );
  }
}
