import 'package:flutter/material.dart';
import 'package:switchboard/constants.dart';
import 'package:switchboard/features/skills/presentation/viewmodels/skill_viewmodel.dart';
import 'package:switchboard/features/skills/presentation/views/skill_list_desktop_view.dart';
import 'package:switchboard/features/skills/presentation/views/skill_list_mobile_view.dart';
import 'package:switchboard/features/skills/presentation/views/skill_list_tablet_view.dart';

class SkillListPage extends StatefulWidget {
  const SkillListPage({super.key, required this.viewmodel});
  final SkillViewModel viewmodel;
  static String route() => "/skills";

  @override
  SkillListPageState createState() => SkillListPageState();
}

class SkillListPageState extends State<SkillListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.viewmodel.load.execute();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('Resilience Skills')),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: widget.viewmodel.load,
          builder: (context, _) {
            return screenSize.width < breakpointSmall
                ? SkillListMobileView(skills: widget.viewmodel.skills)
                : screenSize.width < breakpointMedium
                ? SkillListTabletView(skills: widget.viewmodel.skills)
                : SkillListDesktopView(skills: widget.viewmodel.skills);
          },
        ),
      ),
    );
  }
}
