import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:switchboard/presentation/category_list_page.dart';
import 'package:switchboard/presentation/guides_list_page.dart';
import 'package:switchboard/presentation/home_page.dart';
import 'package:switchboard/presentation/hotline_list_page.dart';
import 'package:switchboard/presentation/resource_list_page.dart';
import 'package:switchboard/presentation/skill_list_page.dart';

import '../core/app_theme.dart';
import '../utility/resilience_search_delegate.dart';
import 'app_list_page.dart';
import 'emergency_page.dart';
import 'faq_page.dart';
import 'unit_list_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CategoryListPage(),
    HotlineListPage(),
    ResourceListPage(),
  ];

  int getIndex() {
    return _selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(
        builder: (context, AppTheme themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Resiliency Switchboard'),
          actions: [
            IconButton(
              onPressed: () {
                themeNotifier.isDark
                    ? themeNotifier.isDark = false
                    : themeNotifier.isDark = true;
              },
              icon: Icon(themeNotifier.isDark
                  ? Icons.nightlight_round
                  : Icons.wb_sunny),
            ),
            IconButton(
              onPressed: () {
                // method to show the search bar
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: ResilienceSearchDelegate());
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        drawer: SafeArea(
          child: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      image: AssetImage('assets/images/operators.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text(
                    'Switchboard',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ListTile(
                  title: const Text('Emergency'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const EmergencyPage();
                    }));
                  },
                ),
                ListTile(
                  title: const Text('Apps'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const AppListPage();
                    }));
                  },
                ),
                ListTile(
                  title: const Text('Skills'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SkillListPage();
                    }));
                  },
                ),
                ListTile(
                  title: const Text('Guides'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const GuidesListPage();
                    }));
                  },
                ),
                ListTile(
                  title: const Text('AFRC Units'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const UnitListPage();
                    }));
                  },
                ),
                ListTile(
                  title: const Text('Frequently Asked Questions'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const FaqPage();
                    }));
                  },
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(child: _widgetOptions.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          key: const Key('navBar'), // used for testing
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                key: Key('home'),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
                key: Key('categories'),
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.phone,
                key: Key('hotlines'),
              ),
              label: 'Hotlines',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.arrowDownAZ,
                key: Key('browse'),
              ),
              label: 'Browse',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          onTap: _onItemTapped,
        ),
      );
    });
  }
}
