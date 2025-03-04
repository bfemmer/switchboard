import 'package:flutter/material.dart';

import 'skill_list_page.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 3.0,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset(
                          'assets/images/resilience.png',
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Theme.of(context).primaryColor
                              : null,
                        )),
                    title: const Text('Resiliency Skills Overview'),
                    subtitle: const Text(
                      'Refresher and quick reference',
                    ),
                  ),
                  Container(
                    color: Theme.of(context)
                        .secondaryHeaderColor
                        .withValues()
                        .withAlpha(128),
                    child: const Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              'First Sergeants receive RTA training and learn resiliency skills as part of the First Sergeant Academy curriculum. The resiliency skills listed below are provided here as a refresher and quick reference and are not intended to be a substitue for formal training in these areas. \n\nIf you are not a First Sergeant, please contact your wing\'s MRTs, RTAs, Resiliency Integrators, or First Sergeants for training opportunities and/or getting more information about these skills.',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SkillListPage();
              }));
            },
            style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
            child: const Text('View Skills'),
          )
        ],
      ),
    );
  }
}
