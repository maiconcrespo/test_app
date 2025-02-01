import 'package:flutter/material.dart';

import 'package:exelin_test_app/features/posts/presentation/widgets/post_list_widget.dart';

class PostPage extends StatelessWidget {
  static String route() => "/posts";

  const PostPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Posts Down',
            style: TextStyle(fontWeight: FontWeight.bold)),       centerTitle: true,
      ),
      body: PostListWidget(),
    );
  }
}
