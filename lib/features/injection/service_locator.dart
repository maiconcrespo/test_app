import 'package:dio/dio.dart';
import 'package:exelin_test_app/features/posts/data/datasources/post_api_datasource.dart';
import 'package:exelin_test_app/features/posts/data/repositories/post_repository_impl.dart';
import 'package:exelin_test_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:exelin_test_app/features/posts/domain/usecases/get_posts.dart';
import 'package:exelin_test_app/features/posts/presentation/cubit/comments/comments_cubit.dart';
import 'package:exelin_test_app/features/posts/presentation/cubit/posts/post_page_cubit.dart';
import 'package:get_it/get_it.dart';


final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
    initPost();
}

void initPost() {

  // Register Dio
 serviceLocator.registerLazySingleton<Dio>(() => Dio());

  //Accessing the Dio instance
  serviceLocator.registerFactory<PostApiDatasource>(() => PostApiDatasource(dio:  serviceLocator<Dio>()),);

  //Accessing the PostRepository instance
  serviceLocator.registerFactory<PostRepository>(() => PostRepositoryImpl(serviceLocator<PostApiDatasource>()));

  //Accessing the GetPosts instance
  serviceLocator.registerFactory<GetPosts>(() => GetPosts(serviceLocator<PostRepository>())); 

  //Cubit
  serviceLocator.registerFactory<PostPageCubit>(() => PostPageCubit(serviceLocator<PostRepository>()));

   // Registering CommentsPageCubit with parameters (postId)
  serviceLocator.registerFactoryParam<CommentsPageCubit, int, PostRepository>(
  (postId, repository) => CommentsPageCubit(postId, repository),);



 
}