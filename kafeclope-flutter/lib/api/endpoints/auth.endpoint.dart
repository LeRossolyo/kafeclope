
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthEndpoint {
  Future<UserCredential> signIn({
    required String email,
    required String password,
  });
  Future<void> register(
      {required String username,
      required String email,
      required String password});
  Future<User?> getUser();
  Future<void> logOut();
}