import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:whitedove/common/roundbutton.dart';
import 'package:whitedove/constants/constants.dart';
import 'package:whitedove/features/auth/view/signup_page.dart';
import 'package:whitedove/features/auth/widgets/auth_textfield.dart';
import 'package:whitedove/theme/pallete.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  var appBar = UIConstants.appBar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AuthTextField(controller: emailController, labelText: 'Email'),
                AuthTextField(
                    controller: passwordController, labelText: 'Password'),
                Align(
                    alignment: Alignment.topRight,
                    child: RoundedButton(onTap: () {}, label: 'Done')),
                const SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: RichText(
                    text: TextSpan(
                        text: "Don't have an account?",
                        style: const TextStyle(fontSize: 16),
                        children: [
                          TextSpan(
                              text: '  Sign up',
                              style: const TextStyle(
                                  color: Pallete.blueColor, fontSize: 16),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const SignUPage(),
                                      ));
                                })
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
