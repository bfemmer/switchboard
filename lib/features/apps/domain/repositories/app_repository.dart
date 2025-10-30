import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/apps/data/models/app.dart';

abstract interface class AppRepository {
  Future<Result<List<App>>> list();
}
