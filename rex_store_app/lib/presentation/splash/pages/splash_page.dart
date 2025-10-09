import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

import "../../../core/configs/assets/app_vectors.dart";
import "../../../core/configs/theme/app_colors.dart";

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: SvgPicture.asset(
          AppVectors.appLogo
        )
      )
    );
  }
}
