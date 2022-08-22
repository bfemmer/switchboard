import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/resource.dart';
import '../repository/resource_repository.dart';
import '../repository/sqlite/sqlite_resource_repository.dart';
import '../utility/url_helper.dart';
import 'widgets/resource_card.dart';

// Image attribution requirement ... to be displayed on store page and in source code:
// <a href="https://www.flaticon.com/free-icons/jack" title="jack icons">Jack icons created by Freepik - Flaticon</a>

class ResourceListPage extends StatefulWidget {
  const ResourceListPage({Key? key}) : super(key: key);

  @override
  ResourceListPageState createState() => ResourceListPageState();
}

class ResourceListPageState extends State<ResourceListPage> {
  late List<Resource> resources;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Resource>>(
        future: getResources(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            child: ListView(
              children: snapshot.data!
                  .map((resource) => Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: ResourceCard(
                          resource: resource,
                        ),
                      ))
                  .toList(),
            ),
          );
        },
      ),
    );
  }

  Future<List<Resource>> getResources() async {
    ResourceRepository repository = SqliteResourceRepository();

    resources = await repository.getResources();
    return resources;
  }
}
