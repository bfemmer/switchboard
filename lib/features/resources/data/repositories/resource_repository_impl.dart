import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/resources/data/datasources/resource_datasource.dart';
import 'package:switchboard/features/resources/data/models/resource.dart';
import 'package:switchboard/features/resources/domain/repositories/resource_repository.dart';

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
  Future<Result<List<Resource>>> listByCategoryId(int id) async {
    try {
      final result = await datasource.listByCategoryId(id);
      return Result.ok(result);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
