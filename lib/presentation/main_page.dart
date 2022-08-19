import 'package:flutter/material.dart';
import 'package:switchboard/presentation/home_page.dart';
import 'package:switchboard/presentation/hotline_list_page.dart';

import '../utility/resilience_search_delegate.dart';
import 'resource_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(title: 'Resiliency Switchboard'),
    HotlineListPage(),
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
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[800],
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
        key: const Key('navBar'), // used for testing
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.phone,
              key: Key('hotlines'),
            ),
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
