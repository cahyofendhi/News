import 'package:flutter/material.dart';

class NewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const NewsAppBar({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? '',
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
