import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../app/data/model/response/failure.dart';

class DioExceptionError implements Exception {
  late Failure failure;
  DioExceptionError.fromDioError(
      {required DioException dioError,
      bool isResponseFromAPI = false,
      bool isCreteaTransaction = false}) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        // TODO: Handle this case.
        failure = Failure(
            statusCode: dioError.response?.statusCode ?? 0,
            message:
                'Request to the server was cancelled.\nsilahkan coba lagi.');
        break;
      case DioExceptionType.connectionTimeout:
        failure = Failure(
            statusCode: dioError.response?.statusCode ?? 0,
            message: 'Connection Timeout.\nsilahkan coba lagi.');
        break;
      case DioExceptionType.sendTimeout:
        failure = Failure(
            statusCode: dioError.response?.statusCode ?? 0,
            message: 'Request send timeout.');
        break;
      case DioExceptionType.receiveTimeout:
        // TODO: Handle this case.
        failure = Failure(
            statusCode: dioError.response?.statusCode ?? 0,
            message: 'Receiving timeout occurred.\nSilahkan coba lagi.');
        break;

      case DioExceptionType.badResponse:
        if (dioError.response?.statusCode == 503) {
          failure = Failure(
              statusCode: dioError.response?.statusCode ?? 0,
              message: 'Receiving timeout occurred.\nSilahkan coba lagi.');
        } else if (dioError.response?.statusCode != 401) {
          failure = Failure(
              statusCode: dioError.response?.statusCode ?? 0,
              message: _handleStatusCode(dioError: dioError));
        } else {
          failure = Failure(
              statusCode: dioError.response?.statusCode ?? 0,
              message: 'Unauthorized\nSilahkan masuk lagi');
        }

        break;

      case DioExceptionType.unknown:
        failure = Failure(
            statusCode: dioError.response?.statusCode ?? 0,
            message: 'Something went wrong.\nSilahkan coba lagi.');
        break;

      default:
        failure = Failure(
            statusCode: dioError.response?.statusCode ?? 0,
            message: 'Something went wrong.\nSilahkan coba lagi.');
    }
  }

  String _handleStatusCode({
    required DioException dioError,
  }) {
    switch (dioError.response!.statusCode) {
      case 400:
        return 'Bad request.\nSilahkan coba lagi.';
      case 401:
        return 'Authentication failed.\nSilahkan coba lagi.';

      case 403:
        return 'Username or Password is incorrect\nSilahkan coba lagi.';
      case 404:
        return 'The requested resource does not exist.\nSilahkan coba lagi.';
      case 405:
        return 'Method not allowed. Please check the Allow header for the allowed HTTP methods.\nSilahkan coba lagi';
      case 415:
        return 'Unsupported media type. The requested content type or version number is invalid.\nSilahkan coba lagi';
      case 422:
        return 'Data validation failed. \nSilahkan coba lagi.';
      case 429:
        return 'Too many requests.\nSilahkan coba lagi.';
      case 500:
        return 'Internal server error.\nSilahkan coba lagi.';
      default:
        return 'Oops something went wrong! \nSilahkan coba lagi';
    }
  }

  @override
  String toString() => failure.message;
}
