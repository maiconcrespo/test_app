import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<bool> {
  SplashCubit() : super(true);

  Future<void> checkAppStatus() async {
    await Future.delayed(const Duration(seconds: 2)); // Simula carga
    emit(false); // Oculta la splash
  }
}