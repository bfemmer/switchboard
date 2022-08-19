import 'package:flutter/material.dart';
import 'package:switchboard/model/unit.dart';

import '../repository/resource_repository.dart';
import '../repository/sqlite/sqlite_resource_repository.dart';
import '../utility/url_helper.dart';

class UnitListPage extends StatefulWidget {
  const UnitListPage({Key? key}) : super(key: key);

  @override
  UnitListPageState createState() => UnitListPageState();
}

class UnitListPageState extends State<UnitListPage> {
  late List<Unit> units;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AFRC Units'),
      ),
      body: FutureBuilder<List<Unit>>(
        future: getUnits(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            child: ListView(
              children: snapshot.data!
                  .map((unit) => Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Card(
                          elevation: 3.0,
                          child: ListTile(
                            title: Text(unit.name!),
                            subtitle: Text(unit.base!),
                            leading: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Image.asset(
                                'assets/images/usaf_roundel.png',
                              ),
                            ),
                            onTap: () {
                              UrlHelper.launchBrowser(unit.link!);
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

  Future<List<Unit>> getUnits() async {
    ResourceRepository repository = SqliteResourceRepository();

    units = await repository.getUnits();
    return units;
  }
}
