import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tesnuncorp/app/routes/app_pages.dart';
import 'package:tesnuncorp/core/utils/state_utils.dart';

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
      body: controller.obx(
        (state) {
          return ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                subtitle: Text(controller.users[index].body),
                title: Text(controller.users[index].title),
              ),
            ),
          );
        },
        onError: (value) {
          return StateUtils.errorData(() => controller.fetchUsers(),
              message: value);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.LOGIN);
        },
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
