import 'dart:async';

import 'package:exelin_test_app/core/widgets/loader.dart';
import 'package:exelin_test_app/core/widgets/search_field.dart';
import 'package:exelin_test_app/features/injection/service_locator.dart';
import 'package:exelin_test_app/features/posts/presentation/blocs/posts/post_page_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PostListWidget extends StatefulWidget {
  final TextEditingController searchController = TextEditingController();
  PostListWidget({super.key});

  @override
  State<PostListWidget> createState() => _PostListWidgetState();
}

class _PostListWidgetState extends State<PostListWidget> {
  Timer? _debounce;

  @override
  void initState()  {
    super.initState();
    
    context.read<PostPageCubit>().getPosts();
    
  }

  @override
  void dispose() {
     _debounce?.cancel();
    super.dispose();
   
  }

  void _onSearchChanged() {
    
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

        _debounce = Timer(const Duration(milliseconds: 1000), () {
      
      serviceLocator<PostPageCubit>().filterPosts(widget.searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchField(
          controller: widget.searchController,
          onChanged: (query)=>_onSearchChanged(),
        ),
        Expanded(
          child: BlocBuilder<PostPageCubit, PostPageState>(
            builder: (context, state) {
              switch (state) {
                case PostPageInitial():
                  return const SizedBox.shrink();
                case PostPageLoading():
                  return Center(child: Loader());
                case PostPageSuccess():
                  final posts = state.posts;

                  return ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push('/comments/${post.id}');
                        },
                        child: Card(
                          margin: const EdgeInsets.all(10),
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              spacing: 10,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    post.title[0].toUpperCase() +
                                        post.title.substring(1),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(post.body[0].toUpperCase() +
                                    post.body.substring(1)),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );

                case PostPageFailure():
                  return Center(
                    child: Text(state.message),
                  );
              }
            },
          ),
        ),
      ],
    );
  }
}
