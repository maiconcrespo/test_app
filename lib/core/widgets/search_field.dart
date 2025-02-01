import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
 final ValueChanged<String> onChanged;
  const SearchField({
    required this.controller,
    required this.onChanged,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}