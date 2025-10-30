import 'package:switchboard/features/units/data/models/unit.dart';

abstract interface class UnitDatasource {
  Future<List<Unit>> list();
}
