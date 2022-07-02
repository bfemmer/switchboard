import 'package:flutter/material.dart';

import 'presentation/main_page.dart';
import 'utility/material_helper.dart';

void main() {
  runApp(const SwitchboardApp());
}

class SwitchboardApp extends StatelessWidget {
  const SwitchboardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Switchboard',
      theme: ThemeData(
        primarySwatch:
            MaterialHelper.getMaterialColorForColor(Colors.blue.shade800),
      ),
      home: const MainPage(),
    );
  }
}
