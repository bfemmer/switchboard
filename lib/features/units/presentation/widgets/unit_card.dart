import 'package:flutter/material.dart';
import 'package:switchboard/features/units/data/models/unit.dart';

import '../../../../core/utils/url_helper.dart';

class UnitCard extends StatefulWidget {
  const UnitCard({required this.unit, super.key});

  final Unit unit;

  @override
  State<UnitCard> createState() => _UnitCardState();
}

class _UnitCardState extends State<UnitCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: ListTile(
        title: Text(widget.unit.name!),
        subtitle: Text(widget.unit.base!),
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Image.asset('assets/images/usaf_roundel.png'),
        ),
        onTap: () {
          UrlHelper.launchBrowser(widget.unit.link!);
        },
      ),
    );
  }
}
