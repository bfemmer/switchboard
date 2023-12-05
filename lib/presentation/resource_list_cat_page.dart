import 'package:flutter/material.dart';

import '../model/category.dart';
import '../model/resource.dart';
import '../repository/resource_repository.dart';
import '../repository/sqlite/sqlite_resource_repository.dart';
import 'widgets/resource_card.dart';

// Image attribution requirement ... to be displayed on store page and in source code:
// <a href="https://www.flaticon.com/free-icons/jack" title="jack icons">Jack icons created by Freepik - Flaticon</a>

class ResourceListCatPage extends StatefulWidget {
  final Category category;

  const ResourceListCatPage({super.key, required this.category});

  @override
  ResourceListCatPageState createState() => ResourceListCatPageState();
}

class ResourceListCatPageState extends State<ResourceListCatPage> {
  late List<Resource> resources;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category.name!)),
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

    resources = await repository.getResourcesByCategoryId(widget.category.id!);
    return resources;
  }
}
