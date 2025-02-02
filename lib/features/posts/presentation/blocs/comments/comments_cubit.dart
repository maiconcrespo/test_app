
import 'package:exelin_test_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:exelin_test_app/features/posts/presentation/blocs/comments/comments_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsPageCubit extends Cubit<CommentsPageState> {
  final PostRepository repository;
  final int postId;
  CommentsPageCubit(
    this.postId,
    this.repository,
  ) : super(CommentsPageInitial());

  Future<void> getComments(int postId) async {
    emit(CommentsPageLoading());
    final result = await repository.getComments(postId);

    result.fold((failure) => emit(CommentsPageFailure(failure.message)),
        (comments) => emit(CommentsPageSuccess(comments, postId)));
  }
}
