import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switchboard/core/app_theme.dart';
import 'package:switchboard/core/router/app_router.dart';
import 'package:switchboard/core/services/notification_service.dart';
import 'package:switchboard/dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const SwitchboardApp());

  // Non-blocking initialization of notification service after app UI launches
  NotificationService.instance.init();
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
            theme: FlexThemeData.light(scheme: FlexScheme.bahamaBlue),
            darkTheme: FlexThemeData.dark(scheme: FlexScheme.bahamaBlue),
            themeMode: themeNotifier.isDark ? ThemeMode.dark : ThemeMode.light,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
