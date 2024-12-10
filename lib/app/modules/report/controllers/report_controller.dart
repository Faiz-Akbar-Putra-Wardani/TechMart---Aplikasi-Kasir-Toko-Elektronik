import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  //TODO: Implement ReportController
  late TextEditingController cBulan;
  late TextEditingController cPenghasilan;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference laporan = firestore.collection('laporan');

    return laporan.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference laporan = firestore.collection('laporan');
    return laporan.snapshots();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cBulan = TextEditingController();
    cPenghasilan = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cBulan.dispose();
    cPenghasilan.dispose();
    super.onClose();
  }
}
