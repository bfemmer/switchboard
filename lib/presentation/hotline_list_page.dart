import 'package:flutter/material.dart';
import 'package:switchboard/presentation/home_mobile_view.dart';

import '../constants.dart';
import '../model/resource.dart';
import '../repository/resource_repository.dart';
import '../repository/sqlite/sqlite_resource_repository.dart';
import 'hotline_list_desktop_view.dart';
import 'hotline_list_mobile_view.dart';
import 'hotline_list_tablet_view.dart';
import 'widgets/resource_card.dart';

class HotlineListPage extends StatefulWidget {
  const HotlineListPage({super.key});

  @override
  HotlineListPageState createState() => HotlineListPageState();
}

class HotlineListPageState extends State<HotlineListPage> {
  late List<Resource> hotlines;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<List<Resource>>(
        future: _getHotlines(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (screenSize.width < breakpointSmall) {
            return HotlineListMobileView(
              resources: hotlines,
            );
          } else if (screenSize.width < breakpointMedium) {
            return HotlineListTabletView(
              resources: hotlines,
            );
          } else {
            return HotlineListDesktopView(
              resources: hotlines,
            );
          }
        },
      ),
    );
  }

  Future<List<Resource>> _getHotlines() async {
    ResourceRepository repository = SqliteResourceRepository();

    hotlines = await repository.getHotlines();
    return hotlines;
  }
}
