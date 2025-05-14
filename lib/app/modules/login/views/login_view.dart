import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tesnuncorp/core/utils/validator_text_form.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<LoginController>();
    return Scaffold(
      appBar: AppBar(title: Text('Soal No 2')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onChanged: (value) => controller.nama.value = value,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                ),
              ),
              Obx(() => controller.errorNama.value.isNotEmpty
                  ? Text(
                      controller.errorNama.value,
                      style: TextStyle(color: Colors.red),
                    )
                  : SizedBox.shrink()),
              SizedBox(height: 30),
              TextField(
                onChanged: (value) => controller.email.value = value,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              Obx(() => controller.errorEmail.value.isNotEmpty
                  ? Text(
                      controller.errorEmail.value,
                      style: TextStyle(color: Colors.red),
                    )
                  : SizedBox.shrink()),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.validate();
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 30),
              Obx(() => controller.isSubmitted.value
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Data yang diinput:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Nama: ${controller.nama.value}'),
                        Text('Email: ${controller.email.value}'),
                      ],
                    )
                  : SizedBox.shrink()),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.COUNTER);
        },
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
