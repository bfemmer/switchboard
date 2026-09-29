import 'package:flutter/material.dart';
import 'package:switchboard/features/skills/data/models/skill.dart';
import 'package:switchboard/features/skills/presentation/widgets/responsive_skill_body.dart';

class SkillListDesktopView extends StatelessWidget {
  const SkillListDesktopView({required this.skills, super.key});

  final List<Skill> skills;

  @override
  Widget build(BuildContext context) {
    return ResponsiveSkillBody(skills: skills);
  }
}
