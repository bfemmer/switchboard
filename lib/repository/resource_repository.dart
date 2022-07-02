import '../model/app.dart';
import '../model/category.dart';
import '../model/hotline.dart';
import '../model/resource.dart';
import '../model/unit.dart';

abstract class ResourceRepository {
  Future<List<Unit>> getUnits();

  Future<List<Category>> getCategories();

  Future<Resource> getResourceById(int id);

  Future<List<Resource>> getResources();

  Future<List<Resource>> getResourcesByCategoryId(int id);

  Future<List<Resource>> getResourcesByKeyword(String keyword);

  Future<List<Hotline>> getHotlines();

  Future<List<App>> getApps();
}
