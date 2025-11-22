import 'package:flutter/material.dart';
import 'package:switchboard/features/units/presentation/viewmodels/unit_viewmodel.dart';
import 'package:switchboard/features/units/presentation/widgets/responsive_unit_body.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text('AFRC Units')),
      body: ListenableBuilder(
        listenable: Listenable.merge([widget.viewmodel.load, widget.viewmodel]),
        builder: (context, _) {
          // Pass the entire viewmodel so we can access filters AND data
          return ResponsiveUnitBody(viewmodel: widget.viewmodel);
        },
      ),
    );
  }
}
