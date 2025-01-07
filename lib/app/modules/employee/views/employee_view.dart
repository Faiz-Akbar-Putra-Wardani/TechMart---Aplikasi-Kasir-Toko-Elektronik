// app/modules/employee/views/employee_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_mobile/app/modules/employee/views/employee_add_view.dart';
import 'package:project_mobile/app/modules/employee/views/employee_update_view.dart';
import 'package:project_mobile/app/modules/home/views/home_view.dart';
import 'package:project_mobile/app/routes/app_pages.dart';

import '../controllers/employee_controller.dart';

class EmployeeView extends StatelessWidget {
  final EmployeeController controller = Get.put(EmployeeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Agar icon dan teks berada di sisi yang berlawanan
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
              onPressed: () {
                Get.to(HomeView());
              },
            ),
            const Text(
              'Pegawai',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              ),
              onPressed: () {
                Get.to(() => EmployeeAddView());
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  SizedBox(width: 9),
                  Text(
                    "Tambah Data +",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Object?>>(
              stream: controller.streamData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Terjadi kesalahan"),
                  );
                }

                var documents = snapshot.data?.docs ?? [];
                if (documents.isEmpty) {
                  return const Center(
                    child: Text("Data Kosong"),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    var data = documents[index].data() as Map<String, dynamic>;
                    var id = documents[index].id;

                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Nama  : ${data['nama']}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Nomor  : ${data['nomor']}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white, // Warna latar tombol
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.3), // Warna bayangan
                                  spreadRadius: 2, // Luas penyebaran bayangan
                                  blurRadius: 4, // Tingkat blur bayangan
                                  offset:
                                      Offset(2, 2), // Posisi bayangan (x, y)
                                ),
                              ],
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8), // Sama dengan radius pada Container
                                ),
                              ),
                              onPressed: () {
                                Get.to(
                                  EmployeeUpdateView(),
                                  arguments: id,
                                );
                              },
                              child: const Text(
                                "Edit",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red, // Warna latar tombol
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.redAccent.withOpacity(
                                      0.5), // Warna bayangan (sedikit lebih terang)
                                  spreadRadius: 2, // Luas penyebaran bayangan
                                  blurRadius: 4, // Tingkat blur bayangan
                                  offset:
                                      Offset(2, 2), // Posisi bayangan (x, y)
                                ),
                              ],
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8), // Sama dengan radius pada Container
                                ),
                                backgroundColor: Colors.red.withOpacity(
                                    0), // Transparan karena diatur di Container
                              ),
                              onPressed: () {
                                controller.delete(id);
                              },
                              child: const Text(
                                "Hapus",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors
                                      .white, // Ubah warna teks menjadi putih untuk kontras
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
