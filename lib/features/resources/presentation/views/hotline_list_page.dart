import 'package:flutter/material.dart';
import 'package:switchboard/features/resources/presentation/viewmodels/resource_viewmodel.dart';

import '../../../../constants.dart';
import 'hotline_list_desktop_view.dart';
import 'hotline_list_mobile_view.dart';
import 'hotline_list_tablet_view.dart';

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
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: ListenableBuilder(
        listenable: widget.viewmodel.loadHotlines,
        builder: (context, _) {
          return screenSize.width < breakpointSmall
              ? HotlineListMobileView(resources: widget.viewmodel.resources)
              : screenSize.width < breakpointMedium
              ? HotlineListTabletView(resources: widget.viewmodel.resources)
              : HotlineListDesktopView(resources: widget.viewmodel.resources);
        },
      ),
    );
  }
}
