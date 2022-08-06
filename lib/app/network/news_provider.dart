import 'package:get/get.dart';
import 'package:news/app/models/news_model.dart';

import 'base_provider.dart';

class NewsProvider extends BaseProvider implements GetxService {
  Future<List<News>> getNews() async {
    try {
      final response = await get('posts');
      if (response.statusCode == 200) {
        return List<News>.from(response.body.map((x) => News.fromJson(x)));
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
