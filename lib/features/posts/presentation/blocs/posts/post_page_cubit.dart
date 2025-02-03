import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exelin_test_app/features/posts/data/models/post_model.dart';

import 'package:exelin_test_app/features/posts/domain/repositories/posts_repository.dart';

part 'post_page_state.dart';

class PostPageCubit extends Cubit<PostPageState> {
  final PostRepository repository;
  List<PostModel> _allPosts = [];
  //List<PostModel> get allPosts => _allPosts;

  PostPageCubit(this.repository) : super(PostPageInitial());

  Future<void> getPosts() async {
    emit(PostPageLoading());
    final result = await repository.getPosts();

    result.fold(
        (failure) => emit(
              PostPageFailure(failure.message),
            ), (posts) {
      _allPosts = posts;
      emit(PostPageSuccess(posts));
    });
  }

  Future<List<PostModel>> filterPosts(String query) async {
    if (_allPosts.isEmpty) {
      await getPosts(); // Waiting Load Posts
     
    }

    final filteredPosts = _allPosts
        .where((post) =>
            post.title.toLowerCase().contains(query.toLowerCase()) ||
            post.body.toLowerCase().contains(query.toLowerCase()))
        .toList();

    print("🔎 Filter by: $query, founds: ${filteredPosts.length}");

    emit(PostPageLoading()); // Loading if necessary

    await Future.delayed(const Duration(milliseconds: 300)); // delay

    emit(PostPageSuccess(filteredPosts)); //Emit success with filtered posts

    return filteredPosts;
  }
}
