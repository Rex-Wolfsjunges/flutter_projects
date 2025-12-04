import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:rex_store_app/common/helper/navigator/app_navigator.dart";
import "package:rex_store_app/common/widgets/appbar/basic_app_bar.dart";
import "package:rex_store_app/common/widgets/button/basic_app_button.dart";
import "package:rex_store_app/presentation/auth/pages/enter_password_page.dart";
import "package:rex_store_app/presentation/auth/pages/signin_page.dart";

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signupText(context),
            const SizedBox(
              height: 20,
            ),
            _firstNameField(context),
            const SizedBox(
              height: 20,
            ),
            _lastNameField(context),
            const SizedBox(
              height: 20,
            ),
            _emailField(context),
            const SizedBox(
              height: 20,
            ),
            _passwordField(context),
            const SizedBox(
              height: 20,
            ),
            _continueButton(context),
            const SizedBox(
              height: 20,
            ),
            _loginAccount(context),
          ],
        ),
      ),
    );
  }

  Widget _signupText(BuildContext context) {
    return const Text('Create Account',
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold));
  }

  Widget _firstNameField(BuildContext context) {
    return const TextField(
        decoration: InputDecoration(
      hintText: "Enter First Name",
    ));
  }

  Widget _lastNameField(BuildContext context) {
    return const TextField(
        decoration: InputDecoration(
      hintText: "Enter Last Name",
    ));
  }

  Widget _emailField(BuildContext context) {
    return const TextField(
        decoration: InputDecoration(
      hintText: "Enter Email",
    ));
  }

  Widget _passwordField(BuildContext context) {
    return const TextField(
        decoration: InputDecoration(
      hintText: "Enter Password",
    ));
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(context, const EnterPasswordPage());
      },
      title: "Continue",
    );
  }

  Widget _loginAccount(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      const TextSpan(
        text: "Do you hava an account?",
      ),
      TextSpan(
          text: "Sign in",
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.pushReplacement(context, const SigninPage());
            },
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ))
    ]));
  }
}
