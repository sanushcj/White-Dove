import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whitedove/common/roundbutton.dart';
import 'package:whitedove/constants/constants.dart';
import 'package:whitedove/features/auth/controller/authentication_controller.dart';
import 'package:whitedove/features/auth/view/signup_page.dart';
import 'package:whitedove/features/auth/widgets/auth_textfield.dart';
import 'package:whitedove/theme/pallete.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  logIn() {
    ref.read(authControllerProvider.notifier).logIn(
        email: emailController.text.trim(),
        password: passwordController.text,
        ctx: context);
  }

  var appBar = UIConstants.appBar();
  @override
  Widget build(BuildContext context) {
        final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: appBar,
      body: isLoading
          ? const Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            )
          : Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AuthTextField(
                          controller: emailController, labelText: 'Email'),
                      AuthTextField(
                          controller: passwordController,
                          labelText: 'Password'),
                      Align(
                          alignment: Alignment.topRight,
                          child:
                              RoundedButton(onTap:logIn, label: 'Done')),
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
                                              builder: (context) =>
                                                  const SignUPage(),
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
