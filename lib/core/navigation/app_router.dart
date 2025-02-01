import 'package:exelin_test_app/features/posts/presentation/pages/comments_page.dart';
import 'package:exelin_test_app/features/posts/presentation/pages/post_page.dart';

import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: PostPage.route(),
    routes: [
      GoRoute(
        path: PostPage.route(),
        builder: (context, _) => PostPage(),
      ),
      GoRoute(
        path: '/detail/:postId',
        builder: (context, state) {
          final postId = int.parse(state.pathParameters['postId']!);
          return DetailPage(postId: postId);
        },
      ),
    ],
  );
}
