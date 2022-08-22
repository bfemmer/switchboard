import '../model/app.dart';
import '../model/category.dart';
import '../model/resource.dart';
import '../model/unit.dart';

abstract class ResourceRepository {
  Future<List<Unit>> getUnits();

  Future<List<Category>> getCategories();

  Future<Category?> getCategoryByName(String name);

  Future<Resource> getResourceById(int id);

  Future<Resource?> getResourceByName(String name);

  Future<List<Resource>> getResources();

  Future<List<Resource>> getResourcesByCategoryId(int id);

  Future<List<Resource>> getResourcesByCategoryName(String name);

  Future<List<Resource>> getResourcesByKeyword(String keyword);

  Future<List<Resource>> getHotlines();

  Future<List<App>> getApps();
}
