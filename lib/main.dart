import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'presentation/main_page.dart';

void main() {
  runApp(const SwitchboardApp());
}

class SwitchboardApp extends StatelessWidget {
  const SwitchboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Switchboard',
      theme: FlexThemeData.light(scheme: FlexScheme.blueM3),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.blueM3),
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.system,
      home: const MainPage(),
    );
  }
}
