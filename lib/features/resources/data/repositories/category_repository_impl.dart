import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/resources/data/datasources/category_datasource.dart';
import 'package:switchboard/features/resources/data/models/category.dart';
import 'package:switchboard/features/resources/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDatasource datasource;

  CategoryRepositoryImpl({required this.datasource});

  @override
  Future<Result<List<Category>>> list() async {
    try {
      final result = await datasource.list();
      return Result.ok(result);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
