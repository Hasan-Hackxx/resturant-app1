import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  // get collection
  final CollectionReference orders = FirebaseFirestore.instance.collection(
    'orders',
  );

  Future<void> saveOrders(String receipt) async {
    await orders.add({'date': DateTime.now(), 'order': receipt});
  }
}
