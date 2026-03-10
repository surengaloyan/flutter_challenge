import 'package:flutter/material.dart';

class AuthScreenControllers {
  final loginUsernameController = TextEditingController();
  final loginPasswordController = TextEditingController();

  final signupEmailController = TextEditingController();
  final signupUsernameController = TextEditingController();
  final signupPasswordController = TextEditingController();

  final formPageController = PageController();

  late GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void disposeControllers() {
    loginUsernameController.dispose();
    loginPasswordController.dispose();
    signupEmailController.dispose();
    signupUsernameController.dispose();
    signupPasswordController.dispose();

    formPageController.dispose();
  }
}
