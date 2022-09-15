import 'package:flutter/material.dart';

import '../model/skill.dart';
import '../repository/resource_repository.dart';
import '../repository/sqlite/sqlite_resource_repository.dart';
import 'widgets/skill_card.dart';

class SkillListPage extends StatefulWidget {
  const SkillListPage({Key? key}) : super(key: key);

  @override
  SkillListPageState createState() => SkillListPageState();
}

class SkillListPageState extends State<SkillListPage> {
  late List<Skill> skills;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resiliency Skills')),
      body: SafeArea(
        child: FutureBuilder<List<Skill>>(
          future: _getSkills(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView(
              children: snapshot.data!
                  .map((skill) => Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: SkillCard(
                          skill: skill,
                        ),
                      ))
                  .toList(),
            );
          },
        ),
      ),
    );
  }

  Future<List<Skill>> _getSkills() async {
    ResourceRepository repository = SqliteResourceRepository();

    skills = await repository.getSkills();
    return skills;
  }
}
