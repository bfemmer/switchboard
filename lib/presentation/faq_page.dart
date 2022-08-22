import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/resource.dart';
import '../repository/resource_repository.dart';
import '../repository/sqlite/sqlite_resource_repository.dart';
import '../utility/url_helper.dart';

// Image attribution requirement ... to be displayed on store page and in source code:
// <a href="https://www.flaticon.com/free-icons/jack" title="jack icons">Jack icons created by Freepik - Flaticon</a>

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  FaqPageState createState() => FaqPageState();
}

class FaqPageState extends State<FaqPage> {
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
                                      alignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            UrlHelper.launchBrowser(
                                                resource.link!);
                                          },
                                          icon: const FaIcon(
                                              FontAwesomeIcons.earthAmericas),
                                          color: Colors.blue,
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

    resources = await repository.getResources();
    return resources;
  }
}
