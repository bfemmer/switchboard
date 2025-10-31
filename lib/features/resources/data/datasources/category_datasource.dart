import 'package:switchboard/features/resources/data/models/category.dart';

abstract interface class CategoryDatasource {
  Future<List<Category>> list();
}
