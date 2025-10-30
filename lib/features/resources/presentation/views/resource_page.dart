import 'package:flutter/material.dart';

import 'category_list_page.dart';
import 'hotline_list_page.dart';
import 'resource_list_page.dart';

class ResourcePage extends StatefulWidget {
  const ResourcePage({super.key});

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
          flexibleSpace: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                tabs: [
                  Tab(text: 'Categories'),
                  Tab(text: 'Hotlines'),
                  Tab(text: 'Browse A-Z'),
                ],
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [CategoryListPage(), HotlineListPage(), ResourceListPage()],
        ),
      ),
    );
  }
}
