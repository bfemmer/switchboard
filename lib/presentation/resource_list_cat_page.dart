import 'package:flutter/material.dart';

import '../model/category.dart';
import '../model/resource.dart';
import '../repository/resource_repository.dart';
import '../repository/sqlite/sqlite_resource_repository.dart';
import '../utility/url_helper.dart';

// Image attribution requirement ... to be displayed on store page and in source code:
// <a href="https://www.flaticon.com/free-icons/jack" title="jack icons">Jack icons created by Freepik - Flaticon</a>

class ResourceListCatPage extends StatefulWidget {
  final Category category;

  const ResourceListCatPage({Key? key, required this.category})
      : super(key: key);

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
                        child: Card(
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: ExpansionTile(
                            title: Text(resource.name!),
                            subtitle: Text(resource.type!),
                            leading: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 15,
                              child: Image.asset(
                                'assets/images/jack.png',
                                color: Colors.blue,
                              ),
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(resource.description!),
                              ),
                              resource.link != null
                                  ? ButtonBar(
                                      alignment: MainAxisAlignment.start,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            UrlHelper.launchBrowser(
                                                resource.link!);
                                          },
                                          child: Text(resource.link!),
                                        ),
                                      ],
                                    )
                                  : Container(),
                            ],
                          ),
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
