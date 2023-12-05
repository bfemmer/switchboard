import 'package:flutter/material.dart';

import '../model/resource.dart';
import '../repository/resource_repository.dart';
import '../repository/sqlite/sqlite_resource_repository.dart';
import 'widgets/resource_card.dart';

class ResourceListPage extends StatefulWidget {
  const ResourceListPage({super.key});

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
          return ListView(
            children: snapshot.data!
                .map((resource) => Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: ResourceCard(
                        resource: resource,
                      ),
                    ))
                .toList(),
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
