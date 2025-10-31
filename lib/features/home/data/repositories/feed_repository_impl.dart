import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/home/data/datasources/feed_datasource.dart';
import 'package:switchboard/features/home/data/models/feed.dart';
import 'package:switchboard/features/home/domain/repositories/feed_repository.dart';

class FeedRepositoryImpl implements FeedRepository {
  final FeedDatasource datasource;

  FeedRepositoryImpl({required this.datasource});

  @override
  Future<Result<List<Feed>>> list() async {
    try {
      final result = await datasource.list();
      return Result.ok(result);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
