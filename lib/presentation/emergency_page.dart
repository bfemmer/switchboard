import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utility/fa_helper.dart';
import '../utility/url_helper.dart';
import 'widgets/ace_card.dart';

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({super.key});

  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 3.0,
              child: ListTile(
                title: const Text('Sexual Assault Help'),
                leading: FaIcon(
                  FaHelper.getIconFromName('ribbon'),
                  color: Colors.teal,
                ),
                onTap: () {
                  UrlHelper.makePhoneCall('8779955247');
                },
                trailing: const Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            child: Card(
              elevation: 3.0,
              child: ListTile(
                title: const Text('Military Crisis Line'),
                leading: FaIcon(
                  FaHelper.getIconFromName('crisis'),
                  color: Colors.red,
                ),
                trailing: const Icon(
                  Icons.phone,
                  color: Colors.red,
                ),
                onTap: () {
                  UrlHelper.makePhoneCall('8002738255');
                },
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            child: AceCard(),
          ),
        ],
      ),
    ));
  }
}
