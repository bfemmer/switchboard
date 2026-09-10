import 'package:flutter/material.dart';
import 'package:switchboard/features/home/presentation/views/dashboard_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String route() => "/home";

  @override
  Widget build(BuildContext context) {
    return const DashboardPage();
  }
}
