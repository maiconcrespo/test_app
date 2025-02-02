import 'package:exelin_test_app/features/posts/presentation/blocs/comments/comments_cubit.dart';
import 'package:exelin_test_app/features/posts/presentation/blocs/comments/comments_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:exelin_test_app/core/widgets/loader.dart';

class CommentListWidget extends StatefulWidget {
  final int postId;

  const CommentListWidget({
    super.key,
    required this.postId,
  });

  @override
  State<CommentListWidget> createState() => _CommentListWidgetState();
}


class _CommentListWidgetState extends State<CommentListWidget> {
  
 @override
  void initState() {
    super.initState();
    context.read<CommentsPageCubit>().getComments(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: BlocBuilder<CommentsPageCubit, CommentsPageState>(
            builder: (context, state) {
              switch (state) {
                case CommentsPageInitial():
                  return const SizedBox.shrink();
                case CommentsPageLoading():
                  return Center(child: Loader());
                case CommentsPageSuccess():
                  final comments = state.comments;
                  return ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: comments.length,
                      itemBuilder: (context, index) => Card(
                            margin: const EdgeInsets.all(10),
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 10,
                                children: [
                                  Text(
                                    "Name: ${comments[index].name[0].toUpperCase() + comments[index].name.substring(1)}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Email: ${comments[index].email}",
                                    
                                  ),
                                  Text(
                                    "Comment: ${comments[index].body[0].toUpperCase() + comments[index].body.substring(1)}",
                                  ),
                                ],
                              ),
                            ),
                          ));

                case CommentsPageFailure():
                  return Center(
                    child: Text(
                        "${state.message} Please check your internet connection"),
                  );
              }
            },
          ),
        ),
      ],
    );
  }
}
