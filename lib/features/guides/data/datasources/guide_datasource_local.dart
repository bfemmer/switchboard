import 'package:switchboard/core/sqlite/database_helper.dart';
import 'package:switchboard/features/guides/data/datasources/guide_datasource.dart';
import 'package:switchboard/features/guides/data/models/guide.dart';

class GuideDatasourceLocal implements GuideDatasource {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  @override
  Future<List<Guide>> list() async {
    var db = await dbHelper.database;
    var result = await db.rawQuery('SELECT * FROM guides ORDER BY name ASC;');
    List<Guide> list = result.isNotEmpty
        ? result.map((c) => Guide.fromJson(c)).toList()
        : [];
    return list;
  }
}
