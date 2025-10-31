import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/feed/data/models/feed.dart';

abstract interface class FeedRepository {
  Future<Result<List<Feed>>> list();
}
