import 'package:flutter/material.dart';
import 'package:switchboard/constants.dart';
import 'package:switchboard/features/units/presentation/viewmodels/unit_viewmodel.dart';
import 'package:switchboard/features/units/presentation/views/unit_list_desktop_view.dart';
import 'package:switchboard/features/units/presentation/views/unit_list_mobile_view.dart';
import 'package:switchboard/features/units/presentation/views/unit_list_tablet_view.dart';

class UnitListPage extends StatefulWidget {
  const UnitListPage({super.key, required this.viewmodel});
  final UnitViewModel viewmodel;
  static String route() => "/units";

  @override
  UnitListPageState createState() => UnitListPageState();
}

class UnitListPageState extends State<UnitListPage> {
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
        child: ListenableBuilder(
          listenable: widget.viewmodel,
          builder: (context, _) {
            return screenSize.width < breakpointSmall
                ? UnitListMobileView(viewmodel: widget.viewmodel)
                : screenSize.width < breakpointMedium
                ? UnitListTabletView(units: widget.viewmodel.units)
                : UnitListDesktopView(units: widget.viewmodel.units);
          },
        ),
      ),
    );
  }
}
