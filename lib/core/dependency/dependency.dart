import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tesnuncorp/app/data/datasource/user_datasource.dart';
import 'package:tesnuncorp/app/data/datasource/user_local_datasource.dart';

class Dependency {
  static void init() {
    Get.put(Dio(), permanent: true);
    Get.lazyPut<IUserDatasource>(() => UserDatasourceImpl(Get.find()));
    Get.lazyPut<IUserLocalDatasource>(() => UserLocalDatasourceImpl());
  }
}
