import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/units/data/datasources/unit_datasource.dart';
import 'package:switchboard/features/units/data/models/unit.dart';
import 'package:switchboard/features/units/domain/repositories/unit_repository.dart';

class UnitRepositoryImpl implements UnitRepository {
  final UnitDatasource datasource;

  UnitRepositoryImpl({required this.datasource});

  @override
  Future<Result<List<Unit>>> list() async {
    try {
      final result = await datasource.list();
      return Result.ok(result);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
