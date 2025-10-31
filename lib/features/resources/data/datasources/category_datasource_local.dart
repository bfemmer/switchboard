import 'package:switchboard/core/sqlite/database_helper.dart';
import 'package:switchboard/features/resources/data/datasources/category_datasource.dart';
import 'package:switchboard/features/resources/data/models/category.dart';

class CategoryDatasourceLocal implements CategoryDatasource {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  @override
  Future<List<Category>> list() async {
    var db = await dbHelper.database;
    var result = await db.rawQuery(
      'SELECT * FROM categories ORDER BY name COLLATE NOCASE ASC;',
    );
    List<Category> list = result.isNotEmpty
        ? result.map((c) => Category.fromJson(c)).toList()
        : [];
    return list;
  }
}
