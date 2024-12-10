import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ReportAddView extends GetView {
  const ReportAddView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReportAddView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ReportAddView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
