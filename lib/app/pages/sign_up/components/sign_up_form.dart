import 'package:fakestore/app/widgets/custom_button.dart';
import 'package:fakestore/app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController hobbyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
        child: Column(
          children: [
            CustomTextField(
              label: "Name",
              hint: "",
              inputType: TextInputType.text,
              controller: nameController,
            ),
            SizedBox(height: 20),
            CustomTextField(
              label: "Email Address",
              hint: "",
              inputType: TextInputType.emailAddress,
              controller: emailController,
            ),
            SizedBox(height: 20),
            CustomTextField(
              label: "Password",
              hint: "",
              isPassword: true,
              inputType: TextInputType.text,
              controller: passwordController,
            ),
            SizedBox(height: 20),
            CustomTextField(
              label: "Hobby",
              hint: "",
              inputType: TextInputType.text,
              controller: hobbyController,
            ),
            SizedBox(height: 30),
            CustomButton(
              text: "Get Started",
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => HomePage(name: nameController.text),
                //   ),
                // );

                Modular.to.navigate(
                  '/productlist/',
                  arguments: {
                    'name': nameController.text.isEmpty
                        ? 'Guest'
                        : nameController.text,
                  },
                );
              },
              width: 287,
              height: 55,
            ),
          ],
        ),
      ),
    );
  }
}
