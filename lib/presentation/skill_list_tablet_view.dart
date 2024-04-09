import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../model/skill.dart';
import 'widgets/skill_card.dart';

class SkillListTabletView extends StatefulWidget {
  const SkillListTabletView({required this.skills, super.key});

  final List<Skill> skills;

  @override
  State<SkillListTabletView> createState() => _SkillListTabletViewState();
}

class _SkillListTabletViewState extends State<SkillListTabletView> {
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
            child: SkillCard(
              skill: widget.skills[index],
            ),
          );
        },
      )),
    );
  }
}
