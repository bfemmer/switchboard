import 'package:flutter/material.dart';

import '../model/resource.dart';
import '../repository/resource_repository.dart';
import '../repository/sqlite/sqlite_resource_repository.dart';
import 'widgets/resource_card.dart';

class HotlineListPage extends StatefulWidget {
  const HotlineListPage({Key? key}) : super(key: key);

  @override
  HotlineListPageState createState() => HotlineListPageState();
}

class HotlineListPageState extends State<HotlineListPage> {
  late List<Resource> hotlines;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Resource>>(
        future: _getHotlines(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: snapshot.data!
                .map((hotline) => Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: ResourceCard(
                        resource: hotline,
                      ),
                    ))
                .toList(),
          );
        },
      ),
    );
  }

  Future<List<Resource>> _getHotlines() async {
    ResourceRepository repository = SqliteResourceRepository();

    hotlines = await repository.getHotlines();
    return hotlines;
  }
}
