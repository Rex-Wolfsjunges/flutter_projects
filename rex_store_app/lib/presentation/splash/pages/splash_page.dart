import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:rex_store_app/presentation/auth/pages/signin_page.dart";
import "package:rex_store_app/presentation/splash/bloc/splash_cubit.dart";
import "package:rex_store_app/presentation/splash/bloc/splash_state.dart";

import "../../../core/configs/assets/app_vectors.dart";
import "../../../core/configs/theme/app_colors.dart";

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SigninPage()));
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: SvgPicture.asset(
            AppVectors.appLogo
          )
        )
      ),
    );
  }
}
