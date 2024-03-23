import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/pos/user_list/view/user_list_view.dart';
import '../view/user_form_view.dart';

class UserFormController extends State<UserFormView> {
  static late UserFormController instance;
  late UserFormView view;

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

  createUser() async {
    bool isLoggedIn = await AuthService().createUser(
      email: email!,
      password: password!,
    );

    if (!isLoggedIn) {
      const snackBar = SnackBar(
        content: Text('Failed To Create User!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    Get.offAll(MainNavigationView());
  }
}
