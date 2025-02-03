import 'package:flutter/material.dart';
import 'package:exelin_test_app/features/posts/presentation/widgets/post_list_widget.dart';

class PostPage extends StatefulWidget {
  static String route() => "/posts";

  const PostPage({
    super.key,
  });

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Posts Down',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: PostListWidget(
        
      ),
    );
  }
}
