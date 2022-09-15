import 'package:switchboard/model/suggestion.dart';

import '../../model/app.dart';
import '../../model/category.dart';
import '../../model/faq.dart';
import '../../model/guide.dart';
import '../../model/resource.dart';
import '../../model/skill.dart';
import '../../model/unit.dart';
import '../resource_repository.dart';
import 'database_helper.dart';

class SqliteResourceRepository extends ResourceRepository {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  @override
  Future<List<Unit>> getUnits() async {
    var db = await dbHelper.database;
    var result = await db
        .rawQuery('SELECT * FROM units ORDER BY name COLLATE NOCASE ASC;');
    List<Unit> list =
        result.isNotEmpty ? result.map((c) => Unit.fromJson(c)).toList() : [];
    return list;
  }

  @override
  Future<List<Faq>> getFaqs() async {
    var db = await dbHelper.database;
    var result = await db.rawQuery('SELECT * FROM faqs ORDER BY id ASC;');
    List<Faq> list =
        result.isNotEmpty ? result.map((c) => Faq.fromJson(c)).toList() : [];
    return list;
  }

  @override
  Future<List<Skill>> getSkills() async {
    var db = await dbHelper.database;
    var result = await db.rawQuery('SELECT * FROM skills ORDER BY id ASC;');
    List<Skill> list =
        result.isNotEmpty ? result.map((c) => Skill.fromJson(c)).toList() : [];
    return list;
  }

  @override
  Future<List<Guide>> getGuides() async {
    var db = await dbHelper.database;
    var result = await db.rawQuery('SELECT * FROM guides ORDER BY name ASC;');
    List<Guide> list =
        result.isNotEmpty ? result.map((c) => Guide.fromJson(c)).toList() : [];
    return list;
  }

  @override
  Future<List<Category>> getCategories() async {
    var db = await dbHelper.database;
    var result = await db
        .rawQuery('SELECT * FROM categories ORDER BY name COLLATE NOCASE ASC;');
    List<Category> list = result.isNotEmpty
        ? result.map((c) => Category.fromJson(c)).toList()
        : [];
    return list;
  }

  @override
  Future<Category?> getCategoryByName(String name) async {
    var db = await dbHelper.database;
    var result =
        await db.query("categories", where: "name = ?", whereArgs: [name]);

    if (result.isNotEmpty) {
      return Category.fromJson(result.first);
    }

    return null;
  }

  @override
  Future<Resource> getResourceById(int id) async {
    var db = await dbHelper.database;
    var result = await db.query("resources", where: "id = ?", whereArgs: [id]);
    return Resource.fromJson(result.first);
  }

  @override
  Future<Resource?> getResourceByName(String name) async {
    var db = await dbHelper.database;
    var result =
        await db.query("resources", where: "name = ?", whereArgs: [name]);

    if (result.isNotEmpty) {
      return Resource.fromJson(result.first);
    }

    return null;
  }

  @override
  Future<List<Resource>> getResources() async {
    var db = await dbHelper.database;
    var result = await db
        .rawQuery('SELECT * FROM resources ORDER BY name COLLATE NOCASE ASC;');
    List<Resource> list = result.isNotEmpty
        ? result.map((c) => Resource.fromJson(c)).toList()
        : [];
    return list;
  }

  @override
  Future<List<Resource>> getResourcesByCategoryId(int id) async {
    var db = await dbHelper.database;
    var query =
        'select r.id, r.name, r.level, r.type, r.description, r.link, r.voice, r.sms, r.icon, r.image  from resources r join categories2resources c2r on r.id = c2r.resource_id join categories c on c2r.category_id = c.id where c.id = $id order by r.name COLLATE NOCASE ASC;';

    var result = await db.rawQuery(query);
    List<Resource> list = result.isNotEmpty
        ? result.map((c) => Resource.fromJson(c)).toList()
        : [];
    return list;
  }

  @override
  Future<List<Resource>> getResourcesByCategoryName(String name) async {
    var db = await dbHelper.database;
    var query =
        'select r.id, r.name, r.level, r.type, r.description, r.link, r.icon, r.image  from resources r join categories2resources c2r on r.id = c2r.resource_id join categories c on c2r.category_id = c.id where c.name = $name order by r.name COLLATE NOCASE ASC;';

    var result = await db.rawQuery(query);
    List<Resource> list = result.isNotEmpty
        ? result.map((c) => Resource.fromJson(c)).toList()
        : [];
    return list;
  }

  @override
  Future<List<Resource>> getResourcesByKeyword(String keyword) async {
    var db = await dbHelper.database;
    var query = 'SELECT * FROM resources WHERE description LIKE "%$keyword%";';

    var result = await db.rawQuery(query);
    List<Resource> list = result.isNotEmpty
        ? result.map((c) => Resource.fromJson(c)).toList()
        : [];
    return list;
  }

  @override
  Future<List<Suggestion>> getResourceAndCategoryNames() async {
    var db = await dbHelper.database;
    var result = await db.rawQuery(
        'select name from categories union select name from resources ORDER BY name COLLATE NOCASE ASC;');

    List<Suggestion> list = result.isNotEmpty
        ? result.map((c) => Suggestion.fromJson(c)).toList()
        : [];

    return list;
  }

  @override
  Future<List<Resource>> getHotlines() async {
    var db = await dbHelper.database;
    var result = await db.rawQuery(
        'SELECT * FROM resources WHERE voice <> "" ORDER BY name COLLATE NOCASE ASC;');
    List<Resource> list = result.isNotEmpty
        ? result.map((c) => Resource.fromJson(c)).toList()
        : [];
    return list;
  }

  @override
  Future<List<App>> getApps() async {
    var db = await dbHelper.database;
    var result = await db
        .rawQuery('SELECT * FROM apps ORDER BY name COLLATE NOCASE ASC;');
    List<App> list =
        result.isNotEmpty ? result.map((c) => App.fromJson(c)).toList() : [];
    return list;
  }
}
