// app/modules/customer/controllers/customer_controller.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController {
  late TextEditingController cBarang;
  late TextEditingController cNama;
  late TextEditingController cQuantity;
  late TextEditingController cTotal;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference pembeli = firestore.collection('pembeli');

    return pembeli.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference pembeli = firestore.collection('pembeli');
    return pembeli.snapshots();
  }

  void add(String nama, String barang, String quantity, String total) async {
    CollectionReference pembeli = firestore.collection("pembeli");

    try {
      await pembeli.add({
        "nama": nama,
        "barang": barang,
        "quantity": quantity,
        "total": total,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data pembeli",
          onConfirm: () {
            cNama.clear();
            cBarang.clear();
            cQuantity.clear();
            cTotal.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Pembeli.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("pembeli").doc(id);

    return docRef.get();
  }

  void Update(
      String nama, String barang, String quantity, String total, String id) async {
    DocumentReference pembeliById = firestore.collection("pembeli").doc(id);

    try {
      await pembeliById.update({
        "nama": nama,
        "barang": barang,
        "quantity": quantity,
        "total": total,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Pembeli.",
        onConfirm: () {
          cNama.clear();
          cBarang.clear();
          cQuantity.clear();
          cTotal.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Pembeli.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef = firestore.collection("pembeli").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin menghapus data pembeli ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: "Sukses",
            middleText: "Berhasil menghapus data pembeli",
          );
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNama = TextEditingController();
    cBarang = TextEditingController();
    cQuantity = TextEditingController();
    cTotal = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cNama.dispose();
    cBarang.dispose();
    cQuantity.dispose();
    cTotal.dispose();
    super.onClose();
  }
}
