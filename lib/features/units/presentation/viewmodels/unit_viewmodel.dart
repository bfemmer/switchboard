import 'package:flutter/foundation.dart';
import 'package:switchboard/core/utils/command.dart';
import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/units/data/models/unit.dart';
import 'package:switchboard/features/units/domain/repositories/unit_repository.dart';

class UnitViewModel extends ChangeNotifier {
  final UnitRepository _unitRepository;

  // State for the selected filter chip
  String _selectedFilter = 'All';
  String get selectedFilter => _selectedFilter;

  List<Unit> _units = [];
  List<Unit> get units => _units;

  late Command0<void> load;

  UnitViewModel(this._unitRepository) {
    load = Command0(_load);
  }

  List<String> get filters {
    final uniqueParents = _units
        .where((unit) => unit.parent != null)
        .map((unit) => unit.parent!)
        .toSet() // Get only unique parents
        .toList();

    // Sort the list of parents alphabetically/numerically
    uniqueParents.sort((a, b) => b.compareTo(a));

    return ['All', ...uniqueParents];
  }

  List<Unit> get filteredUnits {
    if (_selectedFilter == 'All') {
      return _units;
    }
    return _units.where((n) => n.parent == _selectedFilter).toList();
  }

  // Fetching data
  Future<Result> _load() async {
    try {
      Result<List<Unit>> fetchedDataResult = await _unitRepository.list();

      switch (fetchedDataResult) {
        case Ok<List<Unit>>():
          _units = fetchedDataResult.value;

        case Error<List<Unit>>():
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
