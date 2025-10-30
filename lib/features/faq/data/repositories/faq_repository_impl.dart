import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/faq/data/datasources/faq_datasource.dart';
import 'package:switchboard/features/faq/data/models/faq.dart';
import 'package:switchboard/features/faq/domain/repositories/faq_repository.dart';

class FaqRepositoryImpl implements FaqRepository {
  final FaqDatasource datasource;

  FaqRepositoryImpl({required this.datasource});

  @override
  Future<Result<List<Faq>>> list() async {
    try {
      final result = await datasource.list();
      return Result.ok(result);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
