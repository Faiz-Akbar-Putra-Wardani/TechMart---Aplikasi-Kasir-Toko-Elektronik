// app/modules/report/views/report_update_view.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_mobile/app/modules/report/controllers/report_controller.dart';
import 'package:project_mobile/app/modules/report/views/report_view.dart';

class ReportUpdateView extends GetView<ReportController> {
  const ReportUpdateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Update Data Laporan',
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
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future:
            controller.getData(Get.arguments), // Fetch data based on arguments
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Center(child: Text('Error fetching data'));
            }
            if (snapshot.hasData) {
              // Extract data and update TextField controllers
              var data = snapshot.data!.data() as Map<String, dynamic>;
              controller.cBulan.text = data['bulan'];
              controller.cPenghasilan.text = data['penghasilan'];

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: controller.cBulan,
                      decoration: const InputDecoration(
                        labelText: 'Bulan',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: controller.cPenghasilan,
                      decoration: const InputDecoration(
                        labelText: 'Penghasilan',
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
                          onPressed: () => controller.Update(
                            // Pass the ID or reference for update
                            controller.cBulan.text,
                            controller.cPenghasilan.text,
                            Get.arguments,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              SizedBox(width: 9),
                              Text(
                                "Update Data Laporan",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          }
          return const Center(child: Text('No data available'));
        },
      ),
    );
  }
}
