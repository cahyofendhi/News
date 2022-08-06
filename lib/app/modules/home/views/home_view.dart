import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news/app/modules/home/views/widgets/news_shimmer.dart';
import 'package:news/app/modules/home/views/widgets/search_field.dart';
import 'package:news/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';
import 'package:news/app/models/news_model.dart';

import 'widgets/appbar.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: NewsAppBar(key: UniqueKey(), title: 'News'),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildSearch(),
            Expanded(
              child: controller.isLoading.value
                  ? const NewsShimmer()
                  : controller.news.isEmpty
                      ? _buildEmpty()
                      : ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 24),
                          itemBuilder: ((context, index) =>
                              _buildNewsItem(controller.news.value[index])),
                          separatorBuilder: ((context, index) =>
                              const SizedBox(height: 16)),
                          itemCount: controller.news.length),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsItem(News data) {
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: (() =>
            Get.toNamed(Routes.DETAIL_NEWS, arguments: {'data': data})),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.title ?? '-',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Text(
                data.body ?? '-',
                style: const TextStyle(color: Colors.grey, fontSize: 12),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SearchField(onChanged: (value) => controller.onSearch(value)),
    );
  }

  Widget _buildEmpty() {
    return const Center(
      child: Text(
        'data not found',
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
