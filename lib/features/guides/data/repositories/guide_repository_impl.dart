import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/guides/data/datasources/guide_datasource.dart';
import 'package:switchboard/features/guides/data/models/guide.dart';
import 'package:switchboard/features/guides/domain/repositories/guide_repository.dart';

class GuideRepositoryImpl implements GuideRepository {
  final GuideDatasource datasource;

  GuideRepositoryImpl({required this.datasource});

  @override
  Future<Result<List<Guide>>> list() async {
    try {
      final result = await datasource.list();
      return Result.ok(result);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
