part of 'post_page_cubit.dart';

sealed class PostPageState extends Equatable {
  const PostPageState();
   

  @override
  List<Object> get props => [];
}

final class PostPageInitial extends PostPageState {}
final class PostPageLoading extends PostPageState {
  
}
final class PostPageSuccess extends PostPageState {
  final List<PostModel> posts;
  

  const PostPageSuccess(this.posts,);

   @override
  List<Object> get props => [posts];
}
final class PostPageFailure extends PostPageState {
  final String message;

  const PostPageFailure(this.message);

  @override
  List<Object> get props => [message];
}
 