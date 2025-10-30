import 'package:switchboard/core/sqlite/database_helper.dart';
import 'package:switchboard/features/skills/data/datasources/skill_datasource.dart';
import 'package:switchboard/features/skills/data/models/skill.dart';

class SkillDatasourceLocal implements SkillDatasource {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  @override
  Future<List<Skill>> list() async {
    var db = await dbHelper.database;
    var result = await db.rawQuery('SELECT * FROM skills ORDER BY id ASC;');
    List<Skill> list = result.isNotEmpty
        ? result.map((c) => Skill.fromJson(c)).toList()
        : [];
    return list;
  }
}
