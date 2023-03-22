import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whitedove/features/auth/controller/authentication_controller.dart';
import 'package:whitedove/features/auth/view/login_page.dart';
import '../../../common/common.dart';
import '../../../constants/ui_constants.dart';
import '../../../theme/pallete.dart';
import '../widgets/auth_textfield.dart';

class SignUPage extends ConsumerStatefulWidget {
  const SignUPage({super.key});

  @override
  ConsumerState<SignUPage> createState() => _SignUPageState();
}

class _SignUPageState extends ConsumerState<SignUPage> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  onSignUp() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Center(
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
                    label: 'Done',
                    onTap: () {
                      ref.read(authControllerProvider.notifier).signUp(
                          email: emailController.text.trim(),
                          password: passwordController.text,
                          ctx: context);
                    },
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
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ));
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
