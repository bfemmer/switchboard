import 'package:switchboard/features/faq/data/models/faq.dart';

abstract interface class FaqDatasource {
  Future<List<Faq>> list();
}
