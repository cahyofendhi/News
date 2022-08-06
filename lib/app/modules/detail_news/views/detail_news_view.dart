import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/views/widgets/appbar.dart';
import '../controllers/detail_news_controller.dart';

class DetailNewsView extends GetView<DetailNewsController> {
  const DetailNewsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: NewsAppBar(key: UniqueKey(), title: 'News'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.news.value.title ?? '-',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                Text(
                  controller.news.value.body ?? '-',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
