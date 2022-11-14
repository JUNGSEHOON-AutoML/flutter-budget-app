class HistoryRepository {
  void getHistory({required String uid, required Function onSuccess}) {}

  void addHistory(
      {required String uid,
      required int categoryId,
      required String type,
      required int paymentId,
      required int price,
      required String date,
      required String title}) {}

  void updateHistory(
      {required String uid,
      required String recordId,
      int? categoryId,
      String? date,
      String? type,
      int? paymentId,
      int? price,
      String? title}) {}

  void deleteHistory({required String uid, required String recordId}) {}
}
