import 'package:exelin_test_app/core/navigation/app_router.dart';
import 'package:exelin_test_app/features/injection/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/posts/presentation/blocs/blocs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<PostPageCubit>()..getPosts(),
      ),
      BlocProvider(create: (_)=> serviceLocator<ThemeCubit>()..toggleTheme())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
   final theme = serviceLocator<ThemeCubit>().state;
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme:theme.isDarkMode ?ThemeData.dark() : ThemeData.light(),
               routerConfig: AppRouter.router);
  }
}
