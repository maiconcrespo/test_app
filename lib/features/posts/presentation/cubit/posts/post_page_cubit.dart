import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exelin_test_app/features/posts/data/models/post_model.dart';

import 'package:exelin_test_app/features/posts/domain/repositories/posts_repository.dart';

part 'post_page_state.dart';

class PostPageCubit extends Cubit<PostPageState> {
  final PostRepository repository;
  List<PostModel> _allPosts = [];

  PostPageCubit(this.repository) : super(PostPageInitial());

  Future<void> getPosts() async {
    emit(PostPageLoading());
    final result = await repository.getPosts();

    result.fold((failure) => emit(PostPageFailure(failure.message),),
                (posts) {
      _allPosts = posts;
      emit(PostPageSuccess(posts));
    });
  }

Future<List<PostModel>> filterPosts(String query) async {
  if (state is PostPageSuccess) {
    final currentPosts = (state as PostPageSuccess).posts;
    final filteredPosts = _allPosts
        .where((post) =>
            post.title.toLowerCase().contains(query.toLowerCase()) ||
            post.body.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (filteredPosts != currentPosts) {
      emit(PostPageLoading());
      await Future.delayed(Duration(milliseconds: 500));
      emit(PostPageSuccess(filteredPosts));
    }
    return filteredPosts;
  }
  return [];
}
}
