import 'package:flutter/material.dart';
import 'package:switchboard/presentation/app_list_page.dart';

import 'category_list_page.dart';
import 'resource_list_page.dart';

class ResourcePage extends StatefulWidget {
  const ResourcePage({Key? key}) : super(key: key);

  @override
  ResourcePageState createState() => ResourcePageState();
}

class ResourcePageState extends State<ResourcePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              TabBar(
                tabs: [
                  Tab(
                    text: 'Browse A-Z',
                  ),
                  Tab(
                    text: 'Categories',
                  ),
                  Tab(
                    text: 'Apps',
                  ),
                ],
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ResourceListPage(),
            CategoryListPage(),
            AppListPage(),
          ],
        ),
      ),
    );
  }
}
