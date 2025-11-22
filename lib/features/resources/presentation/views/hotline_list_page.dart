import 'package:flutter/material.dart';
import 'package:switchboard/features/resources/presentation/viewmodels/resource_viewmodel.dart';
import 'package:switchboard/features/resources/presentation/widgets/responsive_resource_body.dart';

class HotlineListPage extends StatefulWidget {
  const HotlineListPage({super.key, required this.viewmodel});
  final ResourceViewModel viewmodel;
  static String route() => "/hotlines";

  @override
  HotlineListPageState createState() => HotlineListPageState();
}

class HotlineListPageState extends State<HotlineListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.viewmodel.loadHotlines.execute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: widget.viewmodel.loadHotlines,
        builder: (context, _) {
          return ResponsiveResourceBody(resources: widget.viewmodel.resources);
        },
      ),
    );
  }
}
