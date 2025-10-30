import 'package:switchboard/core/sqlite/database_helper.dart';
import 'package:switchboard/features/faq/data/datasources/faq_datasource.dart';
import 'package:switchboard/features/faq/data/models/faq.dart';

class FaqDatasourceLocal implements FaqDatasource {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  @override
  Future<List<Faq>> list() async {
    var db = await dbHelper.database;
    var result = await db.rawQuery('SELECT * FROM faqs ORDER BY id ASC;');
    List<Faq> list = result.isNotEmpty
        ? result.map((c) => Faq.fromJson(c)).toList()
        : [];
    return list;
  }
}
