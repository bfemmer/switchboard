import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/resources/data/models/category.dart';

abstract interface class CategoryRepository {
  Future<Result<List<Category>>> list();
}
