import 'package:news/app/models/news_model.dart';

import '../network/news_provider.dart';

abstract class INewsRepository {
  Future<List<News>> getNews();
}

class NewsRepository implements INewsRepository {
  final NewsProvider provider;

  NewsRepository({required this.provider});

  @override
  Future<List<News>> getNews() => provider.getNews();
}
