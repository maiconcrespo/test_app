import 'package:flutter/material.dart';

import '../../features/posts/presentation/blocs/blocs.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
 final ValueChanged<String>? onChanged;
 final String hintText;
  const SearchField({
    required this.controller,
    required this.onChanged,
    this.hintText='Search',

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        controller: controller,
        onChanged: onChanged ?? _defaultOnChanged,
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
    void _defaultOnChanged(String value) {
    serviceLocator<PostPageCubit>().filterPosts(value);
  }
}