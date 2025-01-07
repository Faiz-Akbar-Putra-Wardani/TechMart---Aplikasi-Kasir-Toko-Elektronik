// app/modules/report/views/report_add_view.dart
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_mobile/app/modules/report/controllers/report_controller.dart';
import 'package:project_mobile/app/modules/report/views/report_view.dart';

class ReportAddView extends GetView<ReportController> {
  const ReportAddView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Tambah Data Laporan',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller.cBulan,
              decoration: InputDecoration(
                labelText: 'Bulan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.cPenghasilan,
              decoration: InputDecoration(
                labelText: 'Pemasukan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 15),
                  ),
                  onPressed: () => controller.add(
                    controller.cBulan.text,
                    controller.cPenghasilan.text,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(width: 9),
                      Text(
                        "Tambah Data Laporan",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
