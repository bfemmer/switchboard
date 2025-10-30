import 'package:switchboard/core/app_theme.dart';
import 'package:switchboard/core/router/app_router.dart';
import 'package:switchboard/dependencies.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await initDependencies();
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
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Switchboard',
            theme: FlexThemeData.light(scheme: FlexScheme.blueM3),
            darkTheme: FlexThemeData.dark(scheme: FlexScheme.blueM3),
            themeMode: themeNotifier.isDark ? ThemeMode.dark : ThemeMode.light,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
