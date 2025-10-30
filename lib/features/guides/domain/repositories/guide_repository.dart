import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/guides/data/models/guide.dart';

abstract interface class GuideRepository {
  Future<Result<List<Guide>>> list();
}
