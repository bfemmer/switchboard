import 'package:switchboard/features/resources/data/models/category.dart';
import 'package:switchboard/features/resources/data/models/resource.dart';
import 'package:switchboard/features/search/data/models/suggestion.dart';

abstract interface class ResourceDatasource {
  Future<List<Resource>> list();
  Future<List<Resource>> listHotlines();
  Future<List<Resource>> listByCategoryId(int id);
  Future<Category?> getCategoryByName(String name);
  Future<Resource?> getResourceByName(String name);
  Future<List<Suggestion>> getResourceAndCategoryNames();
}
