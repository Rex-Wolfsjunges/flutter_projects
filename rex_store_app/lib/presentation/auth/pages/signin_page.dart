import "package:flutter/material.dart";
import "package:rex_store_app/controllers/basic_app_button.dart";

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 80,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _signinText(context),
            const SizedBox(height: 20,),
            _emailField(context),
            const SizedBox(height: 20,),
            _continueButton(),

          ],
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return const Text('Sign In', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold));
  }

  Widget _emailField(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hintText: "Enter Email",
      )
    );
  }

  Widget _continueButton() {
    return BasicAppButton(
      onPressed: () {},
      title: "Continue",
    );
  }
}
