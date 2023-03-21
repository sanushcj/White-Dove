import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as user;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:whitedove/core/core.dart';
import 'package:whitedove/core/providers.dart';

final authApiProvider = Provider((ref) {
  return AuthAPI(account: ref.watch(appwriteAccountProvider));
});

abstract class AuthenticationAPI {
  FutureEither<user.Account> signUp(
      {required String email, required String password});
}

class AuthAPI implements AuthenticationAPI {
  final Account _account;

  AuthAPI({required Account account}) : _account = account;
  @override
  FutureEither<user.Account> signUp(
      {required String email, required String password}) async {
    try {
      final successAccount = await _account.create(
          userId: ID.unique(), email: email, password: password);
      return right(successAccount);
    } on AppwriteException catch (e, stackTrace) {
      return left(Failure(e.message ?? 'unexpected error occured', stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
}
