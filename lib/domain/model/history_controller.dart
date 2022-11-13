import 'package:account_book/domain/model/record.dart';
import 'package:get/get.dart';

/// key: YYYY-MM (String)
/// value: List<Record>>
class HistoryController extends GetxController {
  final history = <String, List<Record>>{};
}
