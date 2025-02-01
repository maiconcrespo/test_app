import 'package:exelin_test_app/features/injection/service_locator.dart';
import 'package:exelin_test_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:exelin_test_app/features/posts/presentation/cubit/comments/comments_cubit.dart';
import 'package:exelin_test_app/features/posts/presentation/widgets/comments_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  final int postId;
  static String route(int postId) => "/detail/$postId";

  const DetailPage({
    super.key,
    required this.postId,
    
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<CommentsPageCubit>(
        param1: postId,
        param2: serviceLocator<PostRepository>(),
      ),
      child: Scaffold(
       
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('The Posts Down - Detail $postId',
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: CommentListWidget(postId: postId),
      ),
    );
  }
}
