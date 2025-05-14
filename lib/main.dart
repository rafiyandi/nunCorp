import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:tesnuncorp/app/data/model/response/user_response_model.dart';
import 'package:tesnuncorp/core/dependency/dependency.dart';
import 'package:tesnuncorp/core/hive/hive_registrar.g.dart';

import 'app/routes/app_pages.dart';
import 'core/hive/hive_adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapters();

  await Hive.openBox<UserResponseModel>('users');

  Dependency.init();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
