import 'package:flutter/foundation.dart';
import 'package:switchboard/core/utils/command.dart';
import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/home/data/models/feed.dart';
import 'package:switchboard/features/home/domain/repositories/feed_repository.dart';

class FeedViewModel extends ChangeNotifier {
  final FeedRepository _feedRepository;

  List<Feed> _feed = [];
  List<Feed> get feed => _feed;

  late Command0<void> load;

  FeedViewModel(this._feedRepository) {
    load = Command0(_load);
  }

  Future<Result> _load() async {
    try {
      Result<List<Feed>> fetchedDataResult = await _feedRepository.list();

      switch (fetchedDataResult) {
        case Ok<List<Feed>>():
          _feed = fetchedDataResult.value;

        case Error<List<Feed>>():
      }

      return fetchedDataResult;
    } finally {
      notifyListeners();
    }
  }
}
