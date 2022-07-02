import 'package:flutter/material.dart';
import 'package:switchboard/presentation/home_page.dart';
import 'package:switchboard/presentation/hotline_list_page.dart';

import 'app_list_page.dart';
import 'resource_page.dart';
import 'unit_list_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(title: 'Switchboard'),
    HotlineListPage(),
    ResourcePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switchboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                //color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage('assets/images/b52.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text('AFRC Connecting the Network'),
            ),
            ListTile(
              title: const Text('Profile'),
              leading: const Icon(Icons.settings),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('How to use this app'),
              leading: const Icon(Icons.help),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Helpful Apps'),
              onTap: () {
                // close the drawer
                Navigator.pop(context);
                // Show apps page
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AppListPage();
                }));
              },
            ),
            ListTile(
              title: const Text('AFRC Units'),
              onTap: () {
                // close the drawer
                Navigator.pop(context);
                // Show apps page
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const UnitListPage();
                }));
              },
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[800],
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Hotlines',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Resources',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amberAccent,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        onTap: _onItemTapped,
      ),
    );
  }
}
