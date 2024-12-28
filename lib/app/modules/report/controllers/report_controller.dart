import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  //TODO: Implement ReportController
  late TextEditingController cBulan;
  late TextEditingController cPenghasilan;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // ignore: non_constant_identifier_names
  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference laporan = firestore.collection('laporan');

    return laporan.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference laporan = firestore.collection('laporan');
    return laporan.snapshots();
  }

  void add(String bulan, String penghasilan) async {
    CollectionReference pegawai = firestore.collection("laporan");

    try {
      await pegawai.add({
        "bulan": bulan,
        "penghasilan": penghasilan,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data laporan",
          onConfirm: () {
            cBulan.clear();
            cPenghasilan.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan laporan.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("laporan").doc(id);

    return docRef.get();
  }

  void Update(String bulan, String penghasilan, String id) async {
    DocumentReference laporanById = firestore.collection("laporan").doc(id);

    try {
      await laporanById.update({
        "bulan": bulan,
        "penghasilan": penghasilan,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Laporan.",
        onConfirm: () {
          cBulan.clear();
          cPenghasilan.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Laporan.",
      );
    }
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
