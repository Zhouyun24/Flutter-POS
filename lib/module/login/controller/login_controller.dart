import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/pos/employee_main_navigation/view/employee_main_navigation_view.dart';
import 'package:hyper_ui/service/auth_service.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String? email;
  String? password;
  doLogin() async {
    bool isLoggedIn = await AuthService().loginByEmail(
      email: email!,
      password: password!,
    );

    if (!isLoggedIn) {
      const snackBar = SnackBar(
        content: Text('Gagal login'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    if (email == "admin@gmail.com") {
      Get.offAll(MainNavigationView());
    } else if (email != "admin@gmail.com") {
      Get.offAll(EmployeeMainNavigationView());
    }
  }
}
