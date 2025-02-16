import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  
  final loading = false.obs;
  final error = ''.obs;

  void startLoading() {
    loading.value = true;
    error.value = '';
  }

  void stopLoading() {
    loading.value = false;
  }

  void handleError(String message) {
    error.value = message;
    loading.value = false;
  }
}
