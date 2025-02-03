
import 'package:exelin_test_app/features/posts/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final IconData icon;

  const SearchField({
    required this.controller,
    required this.onChanged,
    this.hintText = 'Search',
    this.icon = Icons.search, 
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged ?? 
       _defaultOnChanged,
      textInputAction: TextInputAction.search, 
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}


 void _defaultOnChanged(String value) {
    serviceLocator<PostPageCubit>().filterPosts(value);
  }
