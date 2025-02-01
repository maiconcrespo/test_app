import 'package:exelin_test_app/features/posts/presentation/widgets/post_list_widget.dart';
import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  static String route() => "/posts";

  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('The Posts Down',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: PostListWidget(
        searchController: searchController,
      ),
    );
  }
}
