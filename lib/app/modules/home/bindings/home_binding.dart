import 'package:get/get.dart';
import 'package:news/app/network/news_provider.dart';
import 'package:news/app/repository/news_repository.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsProvider>(() => NewsProvider());
    Get.lazyPut<NewsRepository>(
        () => NewsRepository(provider: Get.find<NewsProvider>()));
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find<NewsRepository>()),
    );
  }
}
