import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsShimmer extends StatelessWidget {
  const NewsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        itemBuilder: ((context, index) => _buildItem()),
        separatorBuilder: ((context, index) => const SizedBox(height: 16)),
        itemCount: 10,
      ),
    );
  }

  Widget _buildItem() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
          ),
        ],
      ),
    );
  }
}
