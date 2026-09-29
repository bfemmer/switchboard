import 'package:flutter/material.dart';
import 'package:switchboard/core/router/nav_scaffold.dart';
import 'package:switchboard/core/utils/loader.dart';
import 'package:switchboard/features/skills/presentation/viewmodels/skill_viewmodel.dart';
import 'package:switchboard/features/skills/presentation/widgets/responsive_skill_body.dart';

class SkillListPage extends StatefulWidget {
  const SkillListPage({super.key, required this.viewmodel});
  final SkillViewModel viewmodel;
  static String route() => "/skills";

  @override
  SkillListPageState createState() => SkillListPageState();
}

class SkillListPageState extends State<SkillListPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.viewmodel.load.execute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resilience Skills'),
        elevation: 0,
        actions: buildAppBarActions(context),
      ),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: widget.viewmodel.load,
          builder: (context, _) {
            if (widget.viewmodel.load.running) {
              return const Loader();
            }
            return ResponsiveSkillBody(skills: widget.viewmodel.skills);
          },
        ),
      ),
    );
  }
}
