import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/resources/data/datasources/resource_datasource.dart';
import 'package:switchboard/features/resources/data/models/category.dart';
import 'package:switchboard/features/resources/data/models/resource.dart';
import 'package:switchboard/features/resources/data/models/video.dart';
import 'package:switchboard/features/resources/domain/repositories/resource_repository.dart';
import 'package:switchboard/features/search/data/models/suggestion.dart';

class ResourceRepositoryImpl implements ResourceRepository {
  final ResourceDatasource datasource;

  ResourceRepositoryImpl({required this.datasource});

  @override
  Future<Result<List<Resource>>> list() async {
    try {
      final result = await datasource.list();
      return Result.ok(result);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<Resource>>> listHotlines() async {
    try {
      final result = await datasource.listHotlines();
      return Result.ok(result);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<Video>>> listVideos() async {
    try {
      final result = await datasource.listVideos();
      return Result.ok(result);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<Resource>>> listByCategoryId(int id) async {
    try {
      final result = await datasource.listByCategoryId(id);
      return Result.ok(result);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Category?>> getCategoryByName(String name) async {
    try {
      final result = await datasource.getCategoryByName(name);
      return Result.ok(result);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Resource?>> getResourceByName(String name) async {
    try {
      final result = await datasource.getResourceByName(name);
      return Result.ok(result);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<List<Suggestion>>> getResourceAndCategoryNames() async {
    try {
      final result = await datasource.getResourceAndCategoryNames();
      return Result.ok(result);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
