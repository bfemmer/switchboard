import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/resources/data/models/resource.dart';

abstract interface class ResourceRepository {
  Future<Result<List<Resource>>> list();
  Future<Result<List<Resource>>> listHotlines();
  Future<Result<List<Resource>>> listByCategoryId(int id);
}
