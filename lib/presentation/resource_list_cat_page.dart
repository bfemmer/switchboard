import 'package:flutter/material.dart';
import 'package:switchboard/presentation/resource_list_desktop_view.dart';

import '../constants.dart';
import '../model/category.dart';
import '../model/resource.dart';
import '../repository/resource_repository.dart';
import '../repository/sqlite/sqlite_resource_repository.dart';
import 'resource_list_mobile_view.dart';
import 'resource_list_tablet_view.dart';

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
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text(widget.category.name!)),
      body: FutureBuilder<List<Resource>>(
        future: getResources(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (screenSize.width < breakpointSmall) {
            return ResourceListMobileView(
              resources: resources,
            );
          } else if (screenSize.width < breakpointMedium) {
            return ResourceListTabletView(
              resources: resources,
            );
          } else {
            return ResourceListDesktopView(
              resources: resources,
            );
          }
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
