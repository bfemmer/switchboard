import 'package:flutter/material.dart';

import '../model/skill.dart';
import 'widgets/skill_card.dart';

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
        itemCount: widget.skills.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SkillCard(
              skill: widget.skills[index],
            ),
          );
        },
      )),
    );
  }
}
