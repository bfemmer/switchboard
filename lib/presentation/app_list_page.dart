import 'package:flutter/material.dart';

import '../model/app.dart';
import '../repository/resource_repository.dart';
import '../repository/sqlite/sqlite_resource_repository.dart';
import '../utility/url_helper.dart';

class AppListPage extends StatefulWidget {
  const AppListPage({super.key});

  @override
  AppListPageState createState() => AppListPageState();
}

class AppListPageState extends State<AppListPage> {
  late List<App> apps;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Apps')),
      body: SafeArea(
        child: FutureBuilder<List<App>>(
          future: _getApps(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView(
              children: snapshot.data!
                  .map((app) => Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              ExpansionTile(
                                title: Text(app.name!),
                                subtitle: Text(app.organization!),
                                leading: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child:
                                      Image.asset('assets/images/${app.icon!}'),
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(app.description!),
                                  ),
                                  OverflowBar(
                                    alignment: MainAxisAlignment.start,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Theme.of(context).platform ==
                                                  TargetPlatform.iOS
                                              ? UrlHelper.launchBrowser(
                                                  app.applestore!)
                                              : UrlHelper.launchBrowser(
                                                  app.playstore!);
                                        },
                                        child: Theme.of(context).platform ==
                                                TargetPlatform.iOS
                                            ? const Text('Visit Apple Store')
                                            : const Text(
                                                'Visit Google Play Store'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            );
          },
        ),
      ),
    );
  }

  Future<List<App>> _getApps() async {
    ResourceRepository repository = SqliteResourceRepository();

    apps = await repository.getApps();
    return apps;
  }
}
