import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switchboard/presentation/home_page.dart';

import '../utility/resilience_search_delegate.dart';
import 'app_list_page.dart';
import 'emergency_page.dart';
import 'faq_page.dart';
import 'resource_page.dart';
import 'skill_list_page.dart';
import 'unit_list_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(title: 'Resiliency Switchboard'),
    SkillListPage(),
    ResourcePage(),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resiliency Switchboard'),
        actions: [
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
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const EmergencyPage();
                }));

                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Leadership Toolkit'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Frequently Asked Questions'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const FaqPage();
                }));
              },
            ),
            ListTile(
              title: const Text('AFRC Units'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const UnitListPage();
                }));

                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Apps'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AppListPage();
                }));

                //Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[800],
        unselectedItemColor: Colors.white60,
        showUnselectedLabels: true,
        key: const Key('navBar'), // used for testing
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.toolbox,
              key: Key('skills'),
            ),
            label: 'Skills',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cable),
            label: 'Resources',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        onTap: _onItemTapped,
      ),
    );
  }
}
