import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exelin_test_app/features/posts/data/models/post_model.dart';

import 'package:exelin_test_app/features/posts/domain/repositories/posts_repository.dart';

part 'post_page_state.dart';

class PostPageCubit extends Cubit<PostPageState> {
  final PostRepository repository;
  List<PostModel> _allPosts = [];
  List<PostModel> get allPosts => _allPosts;

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
  print("Filtrando con: $query"); // Verifica si el query es el esperado

  if (_allPosts.isEmpty) {
    print("⚠️ _allPosts está vacío, intentando cargar...");
    await getPosts(); // Esperamos la carga de los posts
  }

  final filteredPosts = _allPosts
      .where((post) =>
          post.title.toLowerCase().contains(query.toLowerCase()) ||
          post.body.toLowerCase().contains(query.toLowerCase()))
      .toList();

  print("🔎 Filtrando por: $query, encontrados: ${filteredPosts.length}");

  emit(PostPageLoading()); // Solo mostramos el loader si es necesario

  await Future.delayed(const Duration(milliseconds: 500));  // Este delay puede ser innecesario

  emit(PostPageSuccess(filteredPosts));  // Emitir éxito con los posts filtrados
  
  return filteredPosts;

  
}}
