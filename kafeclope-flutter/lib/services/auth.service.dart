import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:kafeclope/api/endpoints/auth.endpoint.dart';

@singleton
class AuthService {
  bool _authicated = false;
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);
  @override
  Future<void> logOut() {
    throw UnimplementedError();
  }

  @override
  Future<User?> getUser() {
    _authicated = true;
    throw UnimplementedError();
  }

  @override
  Future<void> register(
      {required String username,
      required String email,
      required String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> signIn(
      {required String email, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  // static AuthService injected() => injector<AuthService>();

  @factoryMethod
  static AuthService inject(FirebaseAuth auth) {
    return AuthService(auth);
  }

  bool get authenticated => _authicated;
}
