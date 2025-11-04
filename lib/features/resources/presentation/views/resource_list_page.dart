import 'package:flutter/material.dart';
import 'package:switchboard/features/resources/presentation/viewmodels/resource_viewmodel.dart';

import '../../../../constants.dart';
import 'resource_list_desktop_view.dart';
import 'resource_list_mobile_view.dart';
import 'resource_list_tablet_view.dart';

class ResourceListPage extends StatefulWidget {
  const ResourceListPage({super.key, required this.viewmodel});
  final ResourceViewModel viewmodel;
  static String route() => "/resources";

  @override
  ResourceListPageState createState() => ResourceListPageState();
}

class ResourceListPageState extends State<ResourceListPage> {
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
      appBar: AppBar(title: const Text('Browse Resources')),
      body: ListenableBuilder(
        listenable: widget.viewmodel.load,
        builder: (context, _) {
          return screenSize.width < breakpointSmall
              ? ResourceListMobileView(resources: widget.viewmodel.resources)
              : screenSize.width < breakpointMedium
              ? ResourceListTabletView(resources: widget.viewmodel.resources)
              : ResourceListDesktopView(resources: widget.viewmodel.resources);
        },
      ),
    );
  }
}
