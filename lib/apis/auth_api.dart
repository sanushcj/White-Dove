import 'package:appwrite/appwrite.dart';
import 'package:whitedove/core/core.dart';

abstract class AuthenticationAPI {
  FutureEither<Account> signUp(
      {required String email, required String password});
}
