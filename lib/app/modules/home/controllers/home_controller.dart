import 'package:get/get.dart';
import 'package:news/app/models/news_model.dart';
import 'package:news/app/repository/news_repository.dart';

class HomeController extends GetxController {
  final RxBool isLoading = RxBool(false);
  final RxList<News> news = RxList<News>();

  List<News> _newsOrigin = [];

  final NewsRepository repository;

  HomeController(this.repository);

  @override
  void onInit() {
    super.onInit();
    _getNews();
  }

  void onSearch(String query) {
    if (query.isEmpty) {
      news.value = _newsOrigin;
    } else {
      final results = _newsOrigin
          .where((element) => (element.title?.toLowerCase() ?? '')
              .contains(query.toLowerCase()))
          .toList();
      news.value = results;
    }
  }

  Future<void> _getNews() async {
    isLoading.value = true;
    try {
      final response = await repository.getNews();
      _newsOrigin = response;
      news.value = response;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }
}
