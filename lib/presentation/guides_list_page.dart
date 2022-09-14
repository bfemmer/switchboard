import 'package:flutter/material.dart';

import '../model/guide.dart';
import '../repository/resource_repository.dart';
import '../repository/sqlite/sqlite_resource_repository.dart';
import 'guide_detail_page.dart';

class GuidesListPage extends StatefulWidget {
  const GuidesListPage({Key? key}) : super(key: key);

  @override
  State<GuidesListPage> createState() => _GuidesListPageState();
}

class _GuidesListPageState extends State<GuidesListPage> {
  late List<Guide> guides;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quick Guides')),
      body: FutureBuilder<List<Guide>>(
        future: _getGuides(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            child: ListView(
              children: snapshot.data!
                  .map((guide) => Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Card(
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            title: Text(guide.name!),
                            subtitle: Text(guide.subtitle!),
                            leading: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Image.asset(
                                  'assets/images/resilience.png',
                                )),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return GuideDetailPage(
                                  guide: guide,
                                );
                              }));
                            },
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

  Future<List<Guide>> _getGuides() async {
    ResourceRepository repository = SqliteResourceRepository();

    guides = await repository.getGuides();
    return guides;
  }
}
