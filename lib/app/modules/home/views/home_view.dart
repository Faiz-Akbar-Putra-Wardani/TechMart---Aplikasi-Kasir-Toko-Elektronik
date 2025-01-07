// app/modules/home/views/home_view.dart
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_mobile/app/controllers/auth_controller.dart';
import 'package:project_mobile/app/modules/employee/views/employee_add_view.dart';
import 'package:project_mobile/app/modules/employee/views/employee_view.dart';
import 'package:project_mobile/app/modules/product/views/product_add_view.dart';
import 'package:project_mobile/app/modules/product/views/product_view.dart';
import 'package:project_mobile/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  get cAuth => Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return AdminTechMartPage();
  }
}

class AdminTechMartPage extends StatefulWidget {
  @override
  State<AdminTechMartPage> createState() => _AdminTechMartPageState();
}

class _AdminTechMartPageState extends State<AdminTechMartPage> {
  get cAuth => Get.find<AuthController>();
  int _index = 0;
  List<Map> _fragment = [
    {
      'title': 'Data Pegawai',
    },
    {
      'title': 'Data Produk',
    },
    {
      'title': 'Data Pembeli',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        title: const Text('TechMart'),
        backgroundColor: Colors.blue,
        actions: [
          if (_fragment[_index].containsKey('add'))
            IconButton(
              onPressed: () => Get.to(_fragment[_index]['add']()),
              icon: Icon(Icons.add_circle_outline),
            )
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
                'assets/images/GH.png', // Tambahkan logo di folder assets
                height: 300,
                width: 400,
              ),
            ),
            //  const SizedBox(height: 5),
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
                  'Aplikasi Kasir Toko',
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
                      Get.offAllNamed(Routes.CUSTOMER);
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
                      Get.offAllNamed(Routes.REPORT);
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

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              children: [
                Icon(
                  Icons.account_circle,
                  size: 80,
                  color: Colors.white,
                ),
                Text(
                  "Faiz Akbar",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Admin',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Get.offAllNamed(Routes.EMPLOYEE);
              Get.back();
            },
            leading: Icon(Icons.people),
            title: Text('Data Pegawai'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Colors.blue,
            textColor: Colors.blue,
          ),
          ListTile(
            onTap: () {
              Get.offAllNamed(Routes.PRODUCT);
              Get.back();
            },
            leading: Icon(Icons.people),
            title: Text('Data Produk'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Colors.blue,
            textColor: Colors.blue,
          ),
          ListTile(
            onTap: () {
              setState(() => _index = 3);
              Get.back();
            },
            leading: Icon(Icons.people),
            title: Text('Data Pembeli'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Colors.blue,
            textColor: Colors.blue,
          ),
          ListTile(
            onTap: () {
              Get.back();
              cAuth.logout();
            },
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            trailing: Icon(Icons.navigate_next),
            iconColor: Colors.blue,
            textColor: Colors.blue,
          ),
        ],
      ),
    );
  }
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
