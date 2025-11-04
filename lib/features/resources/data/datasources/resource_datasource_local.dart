import 'package:switchboard/core/sqlite/database_helper.dart';
import 'package:switchboard/features/resources/data/datasources/resource_datasource.dart';
import 'package:switchboard/features/resources/data/models/resource.dart';

class ResourceDatasourceLocal implements ResourceDatasource {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  @override
  Future<List<Resource>> list() async {
    var db = await dbHelper.database;
    var result = await db.rawQuery(
      'SELECT * FROM resources ORDER BY name COLLATE NOCASE ASC;',
    );
    List<Resource> list = result.isNotEmpty
        ? result.map((c) => Resource.fromJson(c)).toList()
        : [];
    return list;
  }

  @override
  Future<List<Resource>> listHotlines() async {
    var db = await dbHelper.database;
    var result = await db.rawQuery(
      'SELECT * FROM resources WHERE voice <> "" ORDER BY name COLLATE NOCASE ASC;',
    );
    List<Resource> list = result.isNotEmpty
        ? result.map((c) => Resource.fromJson(c)).toList()
        : [];
    return list;
  }

  @override
  Future<List<Resource>> listByCategoryId(int id) async {
    var db = await dbHelper.database;
    var query =
        'select r.id, r.name, r.level, r.type, r.description, r.link, r.voice, r.sms, r.video, r.icon, r.image  from resources r join categories2resources c2r on r.id = c2r.resource_id join categories c on c2r.category_id = c.id where c.id = $id order by r.name COLLATE NOCASE ASC;';

    var result = await db.rawQuery(query);
    List<Resource> list = result.isNotEmpty
        ? result.map((c) => Resource.fromJson(c)).toList()
        : [];
    return list;
  }
}
