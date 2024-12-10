import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ReportUpdateView extends GetView {
  const ReportUpdateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReportUpdateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ReportUpdateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
