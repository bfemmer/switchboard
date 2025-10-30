import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  // Widget settingsList() {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('Profile Settings')),
  //     body: SettingsList(
  //       sections: [
  //         SettingsSection(
  //           title: const Text('General'),
  //           tiles: [
  //             SettingsTile.navigation(
  //               title: const Text('Abstract settings screen'),
  //               //leading: Icon(CupertinoIcons.wrench),
  //               description:
  //                   const Text('UI created to show plugin\'s possibilities'),
  //               onPressed: (context) {},
  //             )
  //           ],
  //         ),
  //         SettingsSection(
  //           title: const Text('Replications'),
  //           tiles: [
  //             SettingsTile.navigation(
  //               //leading: Icon(CupertinoIcons.settings),
  //               title: const Text('iOS Developer Screen'),
  //               onPressed: (context) {},
  //             ),
  //             SettingsTile.navigation(
  //               //leading: Icon(Icons.settings),
  //               title: const Text('Android Settings Screen'),
  //               onPressed: (context) {},
  //             ),
  //             SettingsTile(
  //               title: const Text('Theme Color'),
  //               leading: const Icon(Icons.palette),
  //               trailing: DropdownButton<String>(
  //                 //value: selectedThemeColor,
  //                 onChanged: (String newValue) {},
  //                 items: <String>['Blue', 'Red', 'Green', 'Purple']
  //                     .map<DropdownMenuItem<String>>((String value) {
  //                   return DropdownMenuItem<String>(
  //                     value: value,
  //                     child: Text(value),
  //                   );
  //                 }).toList(),
  //               ),
  //             )
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
