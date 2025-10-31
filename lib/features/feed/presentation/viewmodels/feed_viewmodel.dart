import 'package:flutter/foundation.dart';
import 'package:switchboard/core/utils/command.dart';
import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/feed/data/models/feed.dart';
import 'package:switchboard/features/feed/domain/repositories/feed_repository.dart';

class FeedViewModel extends ChangeNotifier {
  final FeedRepository _feedRepository;

  List<Feed> _faqs = [];
  List<Feed> get faqs => _faqs;

  late Command0<void> load;

  FeedViewModel(this._feedRepository) {
    load = Command0(_load);
  }

  Future<Result> _load() async {
    try {
      Result<List<Feed>> fetchedDataResult = await _feedRepository.list();

      switch (fetchedDataResult) {
        case Ok<List<Feed>>():
          _faqs = fetchedDataResult.value;

        case Error<List<Feed>>():
      }

      return fetchedDataResult;
    } finally {
      notifyListeners();
    }
  }
}
