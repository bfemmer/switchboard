import 'package:switchboard/features/guides/data/models/guide.dart';

abstract interface class GuideDatasource {
  Future<List<Guide>> list();
}
