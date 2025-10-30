import 'package:switchboard/core/utils/result.dart';
import 'package:switchboard/features/faq/data/models/faq.dart';

abstract interface class FaqRepository {
  Future<Result<List<Faq>>> list();
}
