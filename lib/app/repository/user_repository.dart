import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:tesnuncorp/app/data/datasource/user_datasource.dart';
import 'package:tesnuncorp/app/data/datasource/user_local_datasource.dart';

import '../../core/provider/dio_exception.dart';
import '../data/model/response/failure.dart';
import '../data/model/response/user_response_model.dart';

abstract class IUserRepository {
  Future<Either<Failure, List<UserResponseModel>>> fetchUsers();
}

class UserRepositoryImpl implements IUserRepository {
  final IUserLocalDatasource _localDatasource;
  final IUserDatasource _datasource;
  UserRepositoryImpl(this._localDatasource, this._datasource);
  @override
  Future<Either<Failure, List<UserResponseModel>>> fetchUsers() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());
      final box = Hive.box<UserResponseModel>('users');

      if (connectivityResult.contains(ConnectivityResult.none)) {
        List<UserResponseModel> users = await _localDatasource.fetchUsers();
        return Right(users);
      } else {
        List<UserResponseModel> users = await _datasource.fetchUsers();
        await box.addAll(users);

        return Right(users);
      }
    } on DioException catch (err) {
      final exception = DioExceptionError.fromDioError(
          dioError: err, isResponseFromAPI: true);
      return Left(exception.failure);
    }
  }
}
