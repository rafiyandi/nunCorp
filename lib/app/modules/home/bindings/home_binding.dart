import 'package:get/get.dart';
import 'package:tesnuncorp/app/repository/user_repository.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IUserRepository>(
      () => UserRepositoryImpl(Get.find(), Get.find()),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find()),
    );
  }
}
