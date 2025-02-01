import 'package:exelin_test_app/core/error/failure.dart';
import 'package:exelin_test_app/core/usecases/usecase.dart';
import 'package:exelin_test_app/features/posts/data/models/coments_model.dart';
import 'package:exelin_test_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetComments implements Usecase<List<CommentsModel>, PostIdParams> {
  final PostRepository repository;

  GetComments(this.repository);

  @override
  Future<Either<Failure, List<CommentsModel>>> call(PostIdParams params) async {
    return await repository.getComments(params.postId);
  }
}

class PostIdParams {
  final int postId;

  PostIdParams(this.postId);
}
