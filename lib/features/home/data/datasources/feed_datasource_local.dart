import 'package:switchboard/core/sqlite/database_helper.dart';
import 'package:switchboard/features/home/data/datasources/feed_datasource.dart';
import 'package:switchboard/features/home/data/models/feed.dart';

class FeedDatasourceLocal implements FeedDatasource {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  @override
  Future<List<Feed>> list() async {
    var db = await dbHelper.database;
    var result = await db.rawQuery(
      'SELECT * FROM feed ORDER BY sortOrder ASC;',
    );
    List<Feed> list = result.isNotEmpty
        ? result.map((c) => Feed.fromJson(c)).toList()
        : [];
    return list;
  }
}
