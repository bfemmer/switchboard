import 'package:flutter/material.dart';
import 'package:switchboard/core/utils/loader.dart';
import 'package:switchboard/features/guides/presentation/viewmodels/guide_viewmodel.dart';
import 'package:switchboard/features/guides/presentation/widgets/responsive_guide_body.dart';
import 'guide_detail_page.dart';

class GuidesListPage extends StatefulWidget {
  const GuidesListPage({super.key, required this.viewmodel});
  final GuideViewModel viewmodel;
  static String route() => "/guides";

  @override
  State<GuidesListPage> createState() => _GuidesListPageState();
}

class _GuidesListPageState extends State<GuidesListPage> {
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
    return Scaffold(
      appBar: AppBar(title: const Text('Quick Guides')),
      body: ListenableBuilder(
        listenable: Listenable.merge([widget.viewmodel.load, widget.viewmodel]),
        builder: (context, _) {
          return ResponsiveGuideBody(viewmodel: widget.viewmodel);
        },
      ),
    );
  }
}
