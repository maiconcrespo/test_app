import 'package:exelin_test_app/features/injection/service_locator.dart';
import 'package:exelin_test_app/features/posts/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:exelin_test_app/features/posts/presentation/widgets/post_list_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        actions: [
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return IconButton(
                icon: Icon(state.isDarkMode
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined),
                onPressed: () => serviceLocator<ThemeCubit>().toggleTheme(),
              );
            },
          ),
        ],
        title: Text('The Posts Down',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: PostListWidget(),
    );
  }
}
