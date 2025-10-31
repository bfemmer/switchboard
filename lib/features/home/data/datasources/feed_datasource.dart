import 'package:switchboard/features/home/data/models/feed.dart';

abstract interface class FeedDatasource {
  Future<List<Feed>> list();
}
