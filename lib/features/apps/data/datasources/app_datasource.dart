import 'package:switchboard/features/apps/data/models/app.dart';

abstract interface class AppDatasource {
  Future<List<App>> list();
}
