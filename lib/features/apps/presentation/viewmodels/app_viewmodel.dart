import 'package:flutter/foundation.dart';
import 'package:switchboard/core/utils/command.dart';
import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/apps/data/models/app.dart';
import 'package:switchboard/features/apps/domain/repositories/app_repository.dart';

class AppViewModel extends ChangeNotifier {
  final AppRepository _appRepository;

  List<App> _apps = [];
  List<App> get apps => _apps;

  late Command0<void> load;

  AppViewModel(this._appRepository) {
    load = Command0(_load);
  }

  Future<Result> _load() async {
    try {
      Result<List<App>> fetchedDataResult = await _appRepository.list();

      switch (fetchedDataResult) {
        case Ok<List<App>>():
          _apps = fetchedDataResult.value;

        case Error<List<App>>():
      }

      return fetchedDataResult;
    } finally {
      notifyListeners();
    }
  }
}
