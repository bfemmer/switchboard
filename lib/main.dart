import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/app_theme.dart';
import 'features/home/presentation/views/main_page.dart';

void main() {
  runApp(const SwitchboardApp());
}

class SwitchboardApp extends StatelessWidget {
  const SwitchboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppTheme(),
      child: Consumer<AppTheme>(
        builder: (context, AppTheme themeNotifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Switchboard',
            theme: FlexThemeData.light(scheme: FlexScheme.blueM3),
            darkTheme: FlexThemeData.dark(scheme: FlexScheme.blueM3),
            // Use dark or light theme based on preferences
            themeMode: themeNotifier.isDark ? ThemeMode.dark : ThemeMode.light,
            home: const MainPage(),
          );
        },
      ),
    );
  }
}
