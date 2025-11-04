import 'package:switchboard/features/resources/data/models/resource.dart';

abstract interface class ResourceDatasource {
  Future<List<Resource>> list();
  Future<List<Resource>> listHotlines();
  Future<List<Resource>> listByCategoryId(int id);
}
