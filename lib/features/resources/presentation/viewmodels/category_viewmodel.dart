import 'package:flutter/material.dart';
import 'package:switchboard/core/utils/command.dart';
import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/resources/data/models/category.dart';
import 'package:switchboard/features/resources/domain/repositories/category_repository.dart';

class CategoryViewModel extends ChangeNotifier {
  final CategoryRepository _categoryRepository;

  List<Category> _categories = [];
  List<Category> get categories => _categories;

  late Command0<void> load;

  CategoryViewModel(this._categoryRepository) {
    load = Command0(_load);
  }

  Future<Result> _load() async {
    try {
      Result<List<Category>> fetchedDataResult = await _categoryRepository
          .list();

      switch (fetchedDataResult) {
        case Ok<List<Category>>():
          _categories = fetchedDataResult.value;

        case Error<List<Category>>():
      }

      return fetchedDataResult;
    } finally {
      notifyListeners();
    }
  }
}
