import 'package:switchboard/features/apps/data/models/app.dart';
import 'package:switchboard/features/faq/data/models/faq.dart';
import 'package:switchboard/features/feed/data/models/feed.dart';
import 'package:switchboard/features/guides/data/models/guide.dart';
import 'package:switchboard/features/resources/data/models/category.dart';
import 'package:switchboard/features/resources/data/models/resource.dart';
import 'package:switchboard/features/search/data/models/suggestion.dart';
import 'package:switchboard/features/skills/data/models/skill.dart';
import 'package:switchboard/features/units/data/models/unit.dart';

abstract class ResourceRepository {
  Future<List<Unit>> getUnits();

  Future<List<Faq>> getFaqs();

  Future<List<Skill>> getSkills();

  Future<List<Guide>> getGuides();

  Future<List<Feed>> getFeed();

  Future<List<Category>> getCategories();

  Future<Category?> getCategoryByName(String name);

  Future<Resource> getResourceById(int id);

  Future<Resource?> getResourceByName(String name);

  Future<List<Resource>> getResources();

  Future<List<Resource>> getResourcesByCategoryId(int id);

  Future<List<Resource>> getResourcesByCategoryName(String name);

  Future<List<Resource>> getResourcesByKeyword(String keyword);

  Future<List<Suggestion>> getResourceAndCategoryNames();

  Future<List<Resource>> getHotlines();

  Future<List<App>> getApps();
}
