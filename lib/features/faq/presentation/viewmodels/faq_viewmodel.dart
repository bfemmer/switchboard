import 'package:flutter/foundation.dart';
import 'package:switchboard/core/utils/command.dart';
import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/faq/data/models/faq.dart';
import 'package:switchboard/features/faq/domain/repositories/faq_repository.dart';

class FaqViewModel extends ChangeNotifier {
  final FaqRepository _faqRepository;

  List<Faq> _faqs = [];
  List<Faq> get faqs => _faqs;

  late Command0<void> load;

  FaqViewModel(this._faqRepository) {
    load = Command0(_load);
  }

  Future<Result> _load() async {
    try {
      Result<List<Faq>> fetchedDataResult = await _faqRepository.list();

      switch (fetchedDataResult) {
        case Ok<List<Faq>>():
          _faqs = fetchedDataResult.value;

        case Error<List<Faq>>():
      }

      return fetchedDataResult;
    } finally {
      notifyListeners();
    }
  }
}
