import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_mobile/app/modules/product/controllers/product_controller.dart';

class ProductAddView extends GetView<ProductController> {
  const ProductAddView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Tambah Data Produk',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Handle menu action if needed
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller.cNama,
              decoration: InputDecoration(
                labelText: 'Nama Produk',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.cPrice,
              decoration: InputDecoration(
                labelText: 'Harga Produk',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: controller.cStok,
              decoration: InputDecoration(
                labelText: 'Stok Produk',
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
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  ),
                  onPressed: () => controller.add(
                    controller.cNama.text,
                    controller.cPrice.text,
                    controller.cStok.text,

                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      SizedBox(width: 9),
                      Text(
                        "Tambah Data Pegawai",
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
