import 'package:flutter/material.dart';
import 'package:switchboard/features/resources/data/models/resource.dart';

import '../../../../constants.dart';
import '../../../../repository/resource_repository.dart';
import '../../../../repository/sqlite/sqlite_resource_repository.dart';
import 'resource_list_desktop_view.dart';
import 'resource_list_mobile_view.dart';
import 'resource_list_tablet_view.dart';

class ResourceListPage extends StatefulWidget {
  const ResourceListPage({super.key});

  @override
  ResourceListPageState createState() => ResourceListPageState();
}

class ResourceListPageState extends State<ResourceListPage> {
  late List<Resource> resources;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('Browse Resources')),
      body: FutureBuilder<List<Resource>>(
        future: getResources(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (screenSize.width < breakpointSmall) {
            return ResourceListMobileView(resources: resources);
          } else if (screenSize.width < breakpointMedium) {
            return ResourceListTabletView(resources: resources);
          } else {
            return ResourceListDesktopView(resources: resources);
          }
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
