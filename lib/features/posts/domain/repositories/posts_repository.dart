
import 'package:exelin_test_app/core/error/failure.dart';
import 'package:exelin_test_app/features/posts/data/models/coments_model.dart';
import 'package:exelin_test_app/features/posts/data/models/post_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class PostRepository{
  Future<Either<Failure,List<PostModel>>> getPosts();
  
  Future<Either<Failure,List<CommentsModel>>> getComments(int postId);
 
  
}