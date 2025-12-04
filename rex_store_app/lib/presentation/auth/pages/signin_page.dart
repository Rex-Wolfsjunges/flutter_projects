import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:rex_store_app/common/helper/navigator/app_navigator.dart";
import "package:rex_store_app/common/widgets/appbar/basic_app_bar.dart";
import "package:rex_store_app/common/widgets/button/basic_app_button.dart";
import "package:rex_store_app/presentation/auth/pages/enter_password_page.dart";

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(hideBack: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signinText(context),
            const SizedBox(height: 20,),
            _emailField(context),
            const SizedBox(height: 20,),
            _continueButton(context),
            const SizedBox(height: 20,),
            _createAccount(context),
          ],
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return const Text(
        'Sign In', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold));
  }

  Widget _emailField(BuildContext context) {
    return const TextField(
        decoration: InputDecoration(
          hintText: "Enter Email",
        )
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(context, const EnterPasswordPage());
      },
      title: "Continue",
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: "Don't you hava an account?",
          ),
          TextSpan(
            text: "Create one",
            recognizer: TapGestureRecognizer()..onTap = () {

            },
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            )
          )
        ]
      ));
  }
}
