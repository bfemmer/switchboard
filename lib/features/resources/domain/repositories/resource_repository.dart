import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/resources/data/models/category.dart';
import 'package:switchboard/features/resources/data/models/resource.dart';
import 'package:switchboard/features/resources/data/models/video.dart';
import 'package:switchboard/features/search/data/models/suggestion.dart';

abstract interface class ResourceRepository {
  Future<Result<List<Resource>>> list();
  Future<Result<List<Resource>>> listHotlines();
  Future<Result<List<Video>>> listVideos();
  Future<Result<List<Resource>>> listByCategoryId(int id);
  Future<Result<Category?>> getCategoryByName(String name);
  Future<Result<Resource?>> getResourceByName(String name);
  Future<Result<List<Suggestion>>> getResourceAndCategoryNames();
}
