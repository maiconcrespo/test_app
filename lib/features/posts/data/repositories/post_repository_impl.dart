import 'package:dio/dio.dart';
import 'package:exelin_test_app/core/error/failure.dart';
import 'package:exelin_test_app/features/posts/data/datasources/post_api_datasource.dart';
import 'package:exelin_test_app/features/posts/data/models/coments_model.dart';
import 'package:exelin_test_app/features/posts/data/models/post_model.dart';
import 'package:exelin_test_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:fpdart/fpdart.dart';

class PostRepositoryImpl implements PostRepository {
  final PostApiDatasource datasource;
  PostRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, List<PostModel>>> getPosts() async {
    try {
      return right(await datasource.getPosts());
    } on DioException catch (e) {
      return left(Failure(e.message!));
    }
  }



  @override
  Future<Either<Failure, List<CommentsModel>>> getComments(int postId) async {
    try {
      return right(await datasource.getComments(postId));
    } on DioException catch (e) {
      return left(Failure(e.message!));
    }
  }
}
