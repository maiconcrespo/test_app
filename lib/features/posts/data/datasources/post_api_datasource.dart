import 'package:dio/dio.dart';
import 'package:exelin_test_app/features/posts/data/models/coments_model.dart';
import 'package:exelin_test_app/features/posts/data/models/post_model.dart';


class PostApiDatasource  {
  final Dio dio;
  final String endpoint = 'https://jsonplaceholder.typicode.com/posts';
  PostApiDatasource({required this.dio});

  Future<List<PostModel>> getPosts() async {
           
  final Response (:List data) = await dio.get(endpoint);
    return data.map((p)=>PostModel.fromMap(p)).toList();
     
} 

 Future<PostModel> getPostbyId(int id) async {
           
  final Response (:data) = await dio.get('$endpoint/$id');
    return PostModel.fromMap(data);
     
}
  

  Future<List<CommentsModel>> getComments(int postId) async {
   
    final Response (:List data) = await dio.get('$endpoint/$postId/comments');
    return data.map((c)=>CommentsModel.fromMap(c)).toList();
     
}
}
  

  

  

 

