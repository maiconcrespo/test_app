import 'package:exelin_test_app/core/widgets/loader.dart';
import 'package:exelin_test_app/features/posts/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatelessWidget {
  static String route() => "/splash";

  const SplashPage({super.key});
//Simple Loading Page
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, bool>(
      listenWhen: (previous,current)=>!current,
      listener: (context, _) => context.go("/posts"),
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Loader(),
              const SizedBox(height: 20),
              const Text(
                'Loading...',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
