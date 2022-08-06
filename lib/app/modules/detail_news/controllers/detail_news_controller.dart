import 'package:get/get.dart';
import 'package:news/app/models/news_model.dart';

class DetailNewsController extends GetxController {
  final Rx<News> news = Rx(News());

  @override
  void onInit() {
    super.onInit();
    news.value = Get.arguments['data'];
  }
}
