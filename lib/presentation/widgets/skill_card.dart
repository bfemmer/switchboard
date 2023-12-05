import 'package:flutter/material.dart';

import '../../model/skill.dart';

class SkillCard extends StatefulWidget {
  final Skill skill;

  const SkillCard({
    super.key,
    required this.skill,
  });

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  'assets/images/resilience.png',
                )),
            title: Text(widget.skill.skill!),
          ),
          Container(
            color: Theme.of(context).secondaryHeaderColor.withOpacity(0.5),
            child: Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      widget.skill.description!,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 16.0,
                        left: 16.0,
                      ),
                      child: Text(
                        'How to use this skill',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(widget.skill.usage!),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
