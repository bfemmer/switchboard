import 'package:switchboard/core/sqlite/database_helper.dart';
import 'package:switchboard/features/apps/data/datasources/app_datasource.dart';
import 'package:switchboard/features/apps/data/models/app.dart';

class AppDatasourceLocal implements AppDatasource {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  @override
  Future<List<App>> list() async {
    var db = await dbHelper.database;
    var result = await db.rawQuery(
      'SELECT * FROM apps ORDER BY name COLLATE NOCASE ASC;',
    );
    List<App> list = result.isNotEmpty
        ? result.map((c) => App.fromJson(c)).toList()
        : [];
    return list;
  }
}
