import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:whitedove/features/auth/view/login_page.dart';
import '../../../common/common.dart';
import '../../../constants/ui_constants.dart';
import '../../../theme/pallete.dart';
import '../widgets/auth_textfield.dart';

class SignUPage extends StatefulWidget {
  const SignUPage({super.key});

  @override
  State<SignUPage> createState() => _SignUPageState();
}

class _SignUPageState extends State<SignUPage> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: appbar,
      body:Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      // textfield 1
                      AuthTextField(
                        controller: emailController,
                        labelText: 'Email',
                      ),
                    
                      AuthTextField(
                        controller: passwordController,
                        labelText: 'Password',
                      ),
                      const SizedBox(height: 40),
                       Align(
                        alignment: Alignment.topRight,
                        child: RoundedButton(
                          label: 'Done', onTap: () {  },
                        ),
                      ),
                      const SizedBox(height: 50),
                      RichText(
                        text: TextSpan(
                          text: "Already have an account?",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: ' Login',
                              style: const TextStyle(
                                color: Pallete.blueColor,
                                fontSize: 16,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
