import 'package:switchboard/features/feed/data/models/feed.dart';
import 'package:switchboard/features/resources/data/models/category.dart';
import 'package:switchboard/features/resources/data/models/resource.dart';
import 'package:switchboard/features/search/data/models/suggestion.dart';

abstract class ResourceRepository {
  Future<List<Feed>> getFeed();

  Future<List<Category>> getCategories();

  Future<Category?> getCategoryByName(String name);

  // Future<Resource> getResourceById(int id);

  Future<Resource?> getResourceByName(String name);

  Future<List<Resource>> getResources();

  Future<List<Resource>> getResourcesByCategoryId(int id);

  // Future<List<Resource>> getResourcesByCategoryName(String name);

  // Future<List<Resource>> getResourcesByKeyword(String keyword);

  Future<List<Suggestion>> getResourceAndCategoryNames();

  Future<List<Resource>> getHotlines();
}
