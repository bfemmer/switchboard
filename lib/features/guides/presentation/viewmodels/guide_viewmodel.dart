import 'package:flutter/foundation.dart';
import 'package:switchboard/core/utils/command.dart';
import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/guides/data/models/guide.dart';
import 'package:switchboard/features/guides/domain/repositories/guide_repository.dart';

class GuideViewModel extends ChangeNotifier {
  final GuideRepository _guideRepository;

  // State for the selected filter chip
  String _selectedFilter = 'All';
  String get selectedFilter => _selectedFilter;

  List<Guide> _guides = [];
  List<Guide> get guides => _guides;

  late Command0<void> load;

  GuideViewModel(this._guideRepository) {
    load = Command0(_load);
  }

  List<String> get filters {
    final uniqueCategories = _guides
        .where((guide) => guide.subtitle != null)
        .map((guide) => guide.subtitle!)
        .toSet() // Get only unique parents
        .toList();

    // Sort the list of parents alphabetically/numerically
    uniqueCategories.sort();

    return ['All', ...uniqueCategories];
  }

  List<Guide> get filteredGuides {
    if (_selectedFilter == 'All') {
      return _guides;
    }
    return _guides.where((n) => n.subtitle == _selectedFilter).toList();
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

  // Update the selected category and notify listeners
  void selectFilter(String category) {
    if (_selectedFilter != category) {
      _selectedFilter = category;

      // This triggers the UI to re-read 'filteredUnits'
      notifyListeners();
    }
  }
}
