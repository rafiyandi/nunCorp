import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soal No 1'),
        centerTitle: true,
      ),
      body: controller.obx((_) {
        return ListView.builder(
          itemCount: controller.users.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(controller.users[index].title),
          ),
        );
      }),
    );
  }
}
