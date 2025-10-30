import 'package:switchboard/core/sqlite/database_helper.dart';
import 'package:switchboard/features/units/data/datasources/unit_datasource.dart';
import 'package:switchboard/features/units/data/models/unit.dart';

class UnitDatasourceLocal implements UnitDatasource {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  @override
  Future<List<Unit>> list() async {
    var db = await dbHelper.database;
    var result = await db.rawQuery(
      'SELECT * FROM units ORDER BY name COLLATE NOCASE ASC;',
    );
    List<Unit> list = result.isNotEmpty
        ? result.map((c) => Unit.fromJson(c)).toList()
        : [];
    return list;
  }
}
