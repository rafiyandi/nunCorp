import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tesnuncorp/app/data/model/response/failure.dart';
import 'package:tesnuncorp/app/data/model/response/user_response_model.dart';
import 'package:tesnuncorp/core/endpoint/end_point.dart';

import '../../../core/provider/dio_exception.dart';

abstract class IUserDatasource {
  Future<List<UserResponseModel>> fetchUsers();
}

class UserDatasourceImpl implements IUserDatasource {
  final Dio dio;
  UserDatasourceImpl(this.dio);

  @override
  Future<List<UserResponseModel>> fetchUsers() async {
    try {
      final response = await dio.get(EndPoint.host + EndPoint.posts);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        List<UserResponseModel> users = List<UserResponseModel>.from(
            data.map((user) => UserResponseModel.fromJson(user)));
        return users;
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }
  }
}
