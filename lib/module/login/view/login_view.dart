import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              QTextField(
                label: "Email",
                validator: Validator.required,
                suffixIcon: Icons.email,
                value: null,
                onChanged: (value) {
                  controller.email = value;
                },
              ),
              QTextField(
                label: "Password",
                obscure: true,
                validator: Validator.required,
                suffixIcon: Icons.lock,
                value: null,
                onChanged: (value) {
                  controller.password = value;
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 44,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                  ),
                  onPressed: () => controller.doLogin(),
                  child: const Text("Log In"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
