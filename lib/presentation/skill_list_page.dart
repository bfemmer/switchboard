import 'package:flutter/material.dart';

import '../constants.dart';
import '../model/skill.dart';
import '../repository/resource_repository.dart';
import '../repository/sqlite/sqlite_resource_repository.dart';
import 'skill_list_desktop_view.dart';
import 'skill_list_mobile_view.dart';
import 'skill_list_tablet_view.dart';

class SkillListPage extends StatefulWidget {
  const SkillListPage({super.key});

  @override
  SkillListPageState createState() => SkillListPageState();
}

class SkillListPageState extends State<SkillListPage> {
  late List<Skill> skills;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('Resiliency Skills')),
      body: SafeArea(
        child: FutureBuilder<List<Skill>>(
          future: _getSkills(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (screenSize.width < breakpointSmall) {
              return SkillListMobileView(
                skills: skills,
              );
            } else if (screenSize.width < breakpointMedium) {
              return SkillListTabletView(
                skills: skills,
              );
            } else {
              return SkillListDesktopView(
                skills: skills,
              );
            }
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
