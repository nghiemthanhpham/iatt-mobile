import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiHelper {
  
  static handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        Get.snackbar('Error', 'Connection timeout');
        break;
      case DioExceptionType.badResponse:
        handleResponseError(error.response?.statusCode);
        break;
      default:
        Get.snackbar('Error', 'Something went wrong');
    }
  }

  static handleResponseError(int? statusCode) {
    switch (statusCode) {
      case 401:
        Get.snackbar('Error', 'Unauthorized');
        break;
      case 404:
        Get.snackbar('Error', 'Not found');
        break;
      default:
        Get.snackbar('Error', 'Server error');
    }
  }
}
