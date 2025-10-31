import 'package:switchboard/features/feed/data/models/feed.dart';

abstract interface class FeedDatasource {
  Future<List<Feed>> list();
}
