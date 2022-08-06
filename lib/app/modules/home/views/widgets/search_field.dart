import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchField extends StatelessWidget {
  final Function(String) onChanged;

  const SearchField({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
        labelStyle: const TextStyle(color: Colors.black, fontSize: 14),
        hintText: 'Search..',
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        prefixIcon: const Icon(Icons.search_outlined, color: Colors.grey),
      ),
    );
  }
}
