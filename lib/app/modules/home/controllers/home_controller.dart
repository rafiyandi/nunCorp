import 'package:get/get.dart';
import 'package:tesnuncorp/app/data/model/response/user_response_model.dart';
import 'package:tesnuncorp/app/repository/user_repository.dart';

import '../../../../core/utils/utils.dart';
import '../../../data/datasource/user_datasource.dart';

class HomeController extends GetxController with StateMixin {
  final IUserRepository _datasource;
  HomeController(this._datasource);

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  List<UserResponseModel> users = [];

  Future<void> fetchUsers() async {
    change(null, status: RxStatus.loading());
    final response = await _datasource.fetchUsers();
    response.fold((l) {
      change(null, status: RxStatus.error());
      Utils.showSnackbar(message: l.message);
    }, (r) {
      change(null, status: RxStatus.success());
      users = r;
    });
  }
}
