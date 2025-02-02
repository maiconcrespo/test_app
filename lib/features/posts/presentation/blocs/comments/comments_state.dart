

import 'package:equatable/equatable.dart';
import 'package:exelin_test_app/features/posts/data/models/coments_model.dart';

sealed class CommentsPageState extends Equatable {
  const CommentsPageState();

  @override
  List<Object> get props => [];
}

final class CommentsPageInitial extends CommentsPageState {}

final class CommentsPageLoading extends CommentsPageState {}

final class CommentsPageSuccess extends CommentsPageState {
  final List<CommentsModel> comments;
  final int postId;
  const CommentsPageSuccess(this.comments, this.postId);
@override
  List<Object> get props => [comments, postId];
  
}

final class CommentsPageFailure extends CommentsPageState {
  final String message;
  const CommentsPageFailure(this.message);

  @override
  get props => [message];
}
