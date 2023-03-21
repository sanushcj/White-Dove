import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whitedove/apis/auth_api.dart';
import 'package:fpdart/fpdart.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(authAPI: ref.watch(authApiProvider));
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authapi;
  AuthController({required AuthAPI authAPI})
      : _authapi = authAPI,
        super(false);

  void signUp({
    required String email,
    required String password,
    required BuildContext ctx,
  }) async {
    state = true;
  final result =  _authapi.signUp(email: email, password: password);
  // result.fold;
  
  }
}