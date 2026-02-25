
import 'package:fakestore/features/auth/presentation/pages/sign_up/components/sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24, top: 50),
              child: Text(
                "Join us!",
                style: TextStyle(
                  color: Color(0xFF1F1449),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.only(left: 24, right: 24),
              child: SignUpForm(),
            ),
            SizedBox(height: 50),
            Center(
              child: Text(
                "Terms and Conditions",
                style: TextStyle(
                  color: Color(0xFF9698A9),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xFF9698A9),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
