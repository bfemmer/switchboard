import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/apps/data/datasources/app_datasource.dart';
import 'package:switchboard/features/apps/data/models/app.dart';
import 'package:switchboard/features/apps/domain/repositories/app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  final AppDatasource datasource;

  AppRepositoryImpl({required this.datasource});

  @override
  Future<Result<List<App>>> list() async {
    try {
      final result = await datasource.list();
      return Result.ok(result);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
