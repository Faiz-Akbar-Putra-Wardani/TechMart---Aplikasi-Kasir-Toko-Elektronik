import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_mobile/app/controllers/auth_controller.dart';
import 'package:project_mobile/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  get cAuth => Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return AdminTechMartPage();
  }
}

class AdminTechMartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin TechMart'),
        backgroundColor: Colors.blue,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/user_icon.png'), // Ganti dengan ikon pengguna
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),

            // Logo
            Center(
              child: Image.asset(
                'assets/images/LOGO.png', // Tambahkan logo di folder assets
                height: 100,
                width: 300,
              ),
            ),

            const SizedBox(height: 20),

            // Button "Data Admin"
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Tambahkan navigasi untuk Data Admin
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                child: const Text(
                  'Data Admin',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Menu Grid
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  // Data Produk
                  _buildMenuItem(
                    icon: Icons.shopping_cart,
                    label: 'Data Produk',
                    onTap: () {
                      Get.offAllNamed(Routes.PRODUCT);
                    },
                  ),
                  // Data Pembeli
                  _buildMenuItem(
                    icon: Icons.person,
                    label: 'Data Pembeli',
                    onTap: () {
                      // Navigasi ke Data Pembeli
                    },
                  ),
                  // Data Pegawai
                  _buildMenuItem(
                    icon: Icons.work,
                    label: 'Data Pegawai',
                    onTap: () {
                      Get.offAllNamed(Routes.EMPLOYEE);
                    },
                  ),
                  // Data Laporan
                  _buildMenuItem(
                    icon: Icons.report,
                    label: 'Data Laporan',
                    onTap: () {
                      // Navigasi ke Data Laporan
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.blue),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

