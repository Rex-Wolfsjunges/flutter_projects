import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login Your Account",
              style: GoogleFonts.getFont(
                "Lato",
                color: Color(0xff0d120e),
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.2,
              ),
            ),
            Text(
              "Explore the World Exclusives",
              style: GoogleFonts.getFont(
                "Lato",
                color: Color(0xff0d120e),
                fontSize: 14,
                letterSpacing: 0.2,
              ),
            ),
            Image.asset("assets/images/Illustration.png")
          ],
        ),
      )
    );
  }
}
