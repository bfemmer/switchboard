import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:switchboard/core/app_theme.dart';
import 'package:switchboard/dependencies.dart';
import 'package:switchboard/features/search/presentation/widgets/resilience_search_delegate.dart';
import 'package:switchboard/core/utils/url_helper.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(
      builder: (BuildContext context, AppTheme value, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Switchboard'),
            actions: [
              IconButton(
                onPressed: () {
                  value.isDark ? value.isDark = false : value.isDark = true;
                },
                icon: Icon(
                  value.isDark ? Icons.nightlight_round : Icons.wb_sunny,
                ),
              ),
              IconButton(
                onPressed: () {
                  // method to show the search bar
                  showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: ResilienceSearchDelegate(
                      serviceLocator: serviceLocator,
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          drawer: SafeArea(
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage('assets/images/operators.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text(
                      'Switchboard',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  ListTile(
                    title: const Text('Browse Resources'),
                    leading: Icon(
                      FontAwesomeIcons.arrowDownAZ,
                      color: Theme.of(context).primaryColor,
                    ),
                    onTap: () {
                      context.push('/resources');
                    },
                  ),
                  ListTile(
                    title: const Text('Helpful Apps'),
                    leading: Icon(
                      Icons.apps,
                      color: Theme.of(context).primaryColor,
                    ),
                    onTap: () {
                      context.push('/apps');
                    },
                  ),
                  ListTile(
                    title: const Text('Resilience Skills'),
                    leading: Icon(
                      Icons.business_center,
                      color: Theme.of(context).primaryColor,
                    ),
                    onTap: () {
                      context.push('/skills');
                    },
                  ),
                  ListTile(
                    title: const Text('Quick Guides'),
                    leading: Icon(
                      Icons.collections_bookmark,
                      color: Theme.of(context).primaryColor,
                    ),
                    onTap: () {
                      context.push('/guides');
                    },
                  ),
                  ListTile(
                    title: const Text('AFRC Units'),
                    leading: Icon(
                      Icons.map,
                      color: Theme.of(context).primaryColor,
                    ),
                    onTap: () {
                      context.push('/units');
                    },
                  ),
                  ListTile(
                    title: const Text('Connect the Network Guide'),
                    leading: Icon(
                      Icons.download,
                      color: Theme.of(context).primaryColor,
                    ),
                    onTap: () {
                      UrlHelper.launchBrowser(
                        'https://billfemmer.gitlab.io/switchboard-support/Connect_the_Network_Guide_March2025.pdf',
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Frequently Asked Questions'),
                    leading: Icon(
                      Icons.question_mark,
                      color: Theme.of(context).primaryColor,
                    ),
                    onTap: () {
                      context.push('/faqs');
                    },
                  ),
                ],
              ),
            ),
          ),
          body: navigationShell,
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).primaryColorLight,
            currentIndex: navigationShell.currentIndex,
            showUnselectedLabels: true,
            onTap: (index) => navigationShell.goBranch(index),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.phone),
                label: 'Hotlines',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.emergency),
                label: 'Emergency',
              ),
            ],
          ),
        );
      },
    );
  }
}
