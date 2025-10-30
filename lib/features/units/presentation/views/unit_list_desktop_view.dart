import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:switchboard/features/units/data/models/unit.dart';

import '../widgets/unit_card.dart';

class UnitListDesktopView extends StatefulWidget {
  const UnitListDesktopView({required this.units, super.key});

  final List<Unit> units;

  @override
  State<UnitListDesktopView> createState() => _UnitListDesktopViewState();
}

class _UnitListDesktopViewState extends State<UnitListDesktopView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MasonryGridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 4,
          itemCount: widget.units.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: UnitCard(unit: widget.units[index]),
            );
          },
        ),
      ),
    );
  }
}
