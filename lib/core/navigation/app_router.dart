import 'package:exelin_test_app/features/posts/presentation/pages/comments_page.dart';
import 'package:exelin_test_app/features/posts/presentation/pages/post_page.dart';
import 'package:exelin_test_app/features/posts/presentation/pages/splash_page.dart';

import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: SplashPage.route(),
    routes: [
       GoRoute(
        path:'/splash',
        builder: (context, _) => SplashPage(),
      ),
      GoRoute(
        path:'/posts',
        builder: (context, _) => PostPage(),
      ),
      GoRoute(
        path: '/detail/:postId',
        builder: (context, state) {
          final postId = int.parse(state.pathParameters['postId']!);
          return CommentsPage(postId: postId);
        },
      ),
    ],
  );
}
