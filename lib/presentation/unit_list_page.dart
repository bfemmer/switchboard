import 'package:flutter/material.dart';
import 'package:switchboard/model/unit.dart';

import '../constants.dart';
import '../repository/resource_repository.dart';
import '../repository/sqlite/sqlite_resource_repository.dart';
import 'map_page.dart';
import 'unit_list_desktop_view.dart';
import 'unit_list_mobile_view.dart';
import 'unit_list_tablet_view.dart';

class UnitListPage extends StatefulWidget {
  const UnitListPage({super.key});

  @override
  UnitListPageState createState() => UnitListPageState();
}

class UnitListPageState extends State<UnitListPage> {
  late List<Unit> units;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('AFRC Units'),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.push(context, MaterialPageRoute(builder: (context) {
        //           return const MapPage();
        //         }));
        //       },
        //       icon: const Icon(Icons.map))
        // ],
      ),
      body: SafeArea(
        child: FutureBuilder<List<Unit>>(
          future: getUnits(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (screenSize.width < breakpointSmall) {
              return UnitListMobileView(
                units: units,
              );
            } else if (screenSize.width < breakpointMedium) {
              return UnitListTabletView(
                units: units,
              );
            } else {
              return UnitListDesktopView(
                units: units,
              );
            }
          },
        ),
      ),
    );
  }

  Future<List<Unit>> getUnits() async {
    ResourceRepository repository = SqliteResourceRepository();

    units = await repository.getUnits();
    return units;
  }
}
