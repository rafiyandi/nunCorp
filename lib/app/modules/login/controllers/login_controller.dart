import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var nama = ''.obs;
  var email = ''.obs;

  var errorNama = ''.obs;
  var errorEmail = ''.obs;

  var isSubmitted = false.obs;

  bool validate() {
    errorNama.value = '';
    errorEmail.value = '';
    isSubmitted.value = false;

    bool isValid = true;

    if (nama.value.trim().isEmpty) {
      errorNama.value = 'Nama wajib diisi';
      isValid = false;
    }

    if (email.value.trim().isEmpty) {
      errorEmail.value = 'Email wajib diisi';
      isValid = false;
    } else if (!GetUtils.isEmail(email.value)) {
      errorEmail.value = 'Format email tidak valid';
      isValid = false;
    }

    if (isValid) {
      isSubmitted.value = true;
    }

    return isValid;
  }
}
