import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:switchboard/features/skills/data/models/skill.dart';

import '../widgets/skill_card.dart';

class SkillListDesktopView extends StatefulWidget {
  const SkillListDesktopView({required this.skills, super.key});

  final List<Skill> skills;

  @override
  State<SkillListDesktopView> createState() => _SkillListDesktopViewState();
}

class _SkillListDesktopViewState extends State<SkillListDesktopView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 4,
          itemCount: widget.skills.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SkillCard(skill: widget.skills[index]),
            );
          },
        ),
      ),
    );
  }
}
