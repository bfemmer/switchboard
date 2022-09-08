import '../model/app.dart';
import '../model/category.dart';
import '../model/faq.dart';
import '../model/resource.dart';
import '../model/skill.dart';
import '../model/suggestion.dart';
import '../model/unit.dart';

abstract class ResourceRepository {
  Future<List<Unit>> getUnits();

  Future<List<Faq>> getFaqs();

  Future<List<Skill>> getSkills();

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
