import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthVM extends ChangeNotifier {
  StackRouter _router;
  final ImagePicker _picker = ImagePicker();

  AuthVM(this._router) : super();

  factory AuthVM.init(BuildContext context) {
    return AuthVM(AutoRouter.of(context));
  }

  redirectTo(String path) {
    _router.navigateNamed(path);
  }

  login(String email, String password) async {
    // try {
    //   UserCredential user = await FirebaseAuth.instance
    //       .signInWithEmailAndPassword(email: email, password: password);
    //   print(user);
    //   redirectTo('home');
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     print('No user found for that email.');
    //   } else if (e.code == 'wrong-password') {
    //     print('Wrong password provided for that user.');
    //   }
    // } catch(e) {
    //   print(e);
    // }
    print('$email & $password');
    redirectTo('home');
  }

  register(String email, String id, String username, String password) async {
    print('user created');
    redirectTo('auth/picture');
  }

  addProfilePicture() async {
    final XFile? _pic = await _picker.pickImage(source: ImageSource.gallery);
  }
}
