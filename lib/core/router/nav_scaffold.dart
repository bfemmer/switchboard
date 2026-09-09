import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:switchboard/core/app_theme.dart';
import 'package:switchboard/dependencies.dart';
import 'package:switchboard/features/search/presentation/widgets/resilience_search_delegate.dart';

/// Helper method to build standard AppBar actions across Switchboard pages.
/// Includes persistent Emergency Assistance button, Theme toggle, and Search.
List<Widget> buildAppBarActions(
  BuildContext context, {
  bool showEmergency = true,
}) {
  return [
    if (showEmergency)
      IconButton(
        onPressed: () {
          context.push('/emergency');
        },
        icon: const Icon(
          Icons.emergency_outlined,
          color: Colors.red,
        ),
        tooltip: 'Emergency Assistance',
      ),
    Consumer<AppTheme>(
      builder: (BuildContext context, AppTheme appTheme, Widget? child) {
        return IconButton(
          onPressed: () {
            appTheme.isDark = !appTheme.isDark;
          },
          icon: Icon(
            appTheme.isDark ? Icons.nightlight_round : Icons.wb_sunny,
          ),
          tooltip: 'Toggle Dark Mode',
        );
      },
    ),
    IconButton(
      onPressed: () {
        showSearch(
          context: context,
          delegate: ResilienceSearchDelegate(
            serviceLocator: serviceLocator,
          ),
        );
      },
      icon: const Icon(Icons.search),
      tooltip: 'Search Resources',
    ),
  ];
}

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

