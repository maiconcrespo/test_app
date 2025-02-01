import 'package:exelin_test_app/core/navigation/app_router.dart';
import 'package:exelin_test_app/features/injection/service_locator.dart';
import 'package:exelin_test_app/features/posts/presentation/cubit/posts/post_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(
    
    MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<PostPageCubit>()..getPosts(),
      ),
   
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
             theme:ThemeData.light(),
        routerConfig: AppRouter.router);
  }
}
