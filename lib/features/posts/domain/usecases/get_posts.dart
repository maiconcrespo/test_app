import 'package:exelin_test_app/core/error/failure.dart';
import 'package:exelin_test_app/core/usecases/usecase.dart';
import 'package:exelin_test_app/features/posts/domain/entities/post.dart';
import 'package:exelin_test_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetPosts implements Usecase<List<Post>, NoParams> {
  final PostRepository repository;

  GetPosts(this.repository);

  @override
  Future<Either<Failure, List<Post>>> call(NoParams params) async {
    return await repository.getPosts();
  }
}

