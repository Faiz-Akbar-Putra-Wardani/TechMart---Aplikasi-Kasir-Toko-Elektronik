import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  //TODO: Implement ProductController
  late TextEditingController cNama;
  late TextEditingController cPrice;
  late TextEditingController cStok;


  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference produk = firestore.collection('produk');

    return produk.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference produk = firestore.collection('produk');
    return produk.snapshots();
  }

  void add(String nama, String price, String stok) async {
    CollectionReference produk = firestore.collection("produk");

    try {
      await produk.add({
        "nama": nama,
        "price": price,
        "stok" : stok,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data mahasiswa",
          onConfirm: () {
            cNama.clear();
            cPrice.clear();
            cStok.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Mahasiswa.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("produk").doc(id);

    return docRef.get();
  }

  void Update(String nama, String price, String stok, String id) async {
    DocumentReference produkById = firestore.collection("produk").doc(id);

    try {
      await produkById.update({
        "nama": nama,
        "price": price,
        "stok" : stok,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Produk.",
        onConfirm: () {
          cNama.clear();
          cPrice.clear();
          cStok.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Mahasiswa.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef = firestore.collection("produk").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin menghapus produk ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: "Sukses",
            middleText: "Berhasil menghapus produk",
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
    cPrice = TextEditingController();
    cStok = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNama.dispose();
    cPrice.dispose();
    cStok.dispose();
    super.onClose();
  }

}
