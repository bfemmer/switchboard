import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/units/data/models/unit.dart';

abstract interface class UnitRepository {
  Future<Result<List<Unit>>> list();
}
