import 'package:get/get.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = "https://jsonplaceholder.typicode.com/";
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(minutes: 1);
    super.onInit();
  }
}
