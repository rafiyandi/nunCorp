import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:tesnuncorp/app/data/model/response/user_response_model.dart';

abstract class IUserLocalDatasource {
  Future<List<UserResponseModel>> fetchUsers();
}

class UserLocalDatasourceImpl implements IUserLocalDatasource {
  UserLocalDatasourceImpl();
  @override
  Future<List<UserResponseModel>> fetchUsers() async {
    final box = Hive.box<UserResponseModel>('users');

    List<UserResponseModel> users = box.values.toList();

    return users;
  }
}
