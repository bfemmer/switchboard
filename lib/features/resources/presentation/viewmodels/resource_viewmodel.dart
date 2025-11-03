import 'package:flutter/material.dart';
import 'package:switchboard/core/utils/command.dart';
import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/resources/data/models/resource.dart';
import 'package:switchboard/features/resources/domain/repositories/resource_repository.dart';

class ResourceViewModel extends ChangeNotifier {
  final ResourceRepository _resourceRepository;

  List<Resource> _resources = [];
  List<Resource> get resources => _resources;

  late Command1<void, int> load;

  ResourceViewModel(this._resourceRepository) {
    load = Command1(_load);
  }

  Future<Result> _load(int id) async {
    try {
      Result<List<Resource>> fetchedDataResult = await _resourceRepository
          .listByCategoryId(id);

      switch (fetchedDataResult) {
        case Ok<List<Resource>>():
          _resources = fetchedDataResult.value;

        case Error<List<Resource>>():
      }

      return fetchedDataResult;
    } finally {
      notifyListeners();
    }
  }
}
