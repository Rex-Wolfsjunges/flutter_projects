import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rex_store_app/presentation/splash/bloc/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async{
    await Future.delayed(const Duration(seconds: 3));
    emit(
      UnAuthenticated()
    );
  }
}