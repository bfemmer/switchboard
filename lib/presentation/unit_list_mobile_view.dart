import 'package:flutter/material.dart';

import '../model/unit.dart';
import 'widgets/unit_card.dart';

class UnitListMobileView extends StatefulWidget {
  const UnitListMobileView({required this.units, super.key});

  final List<Unit> units;

  @override
  State<UnitListMobileView> createState() => _UnitListMobileViewState();
}

class _UnitListMobileViewState extends State<UnitListMobileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
        itemCount: widget.units.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: UnitCard(
              unit: widget.units[index],
            ),
          );
        },
      )),
    );
  }
}
