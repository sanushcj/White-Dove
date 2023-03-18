import 'package:flutter/material.dart';
import 'package:whitedove/constants/constants.dart';
import 'package:whitedove/features/auth/widgets/auth_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
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
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AuthTextField(controller: emailController, labelText: 'Email'),
                AuthTextField(
                    controller: passwordController, labelText: 'Password')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
