import 'package:flutter/foundation.dart';
import 'package:switchboard/core/utils/command.dart';
import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/guides/data/models/guide.dart';
import 'package:switchboard/features/guides/domain/repositories/guide_repository.dart';

class GuideViewModel extends ChangeNotifier {
  final GuideRepository _guideRepository;

  List<Guide> _guides = [];
  List<Guide> get guides => _guides;

  late Command0<void> load;

  GuideViewModel(this._guideRepository) {
    load = Command0(_load);
  }

  Future<Result> _load() async {
    try {
      Result<List<Guide>> fetchedDataResult = await _guideRepository.list();

      switch (fetchedDataResult) {
        case Ok<List<Guide>>():
          _guides = fetchedDataResult.value;

        case Error<List<Guide>>():
      }

      return fetchedDataResult;
    } finally {
      notifyListeners();
    }
  }
}
