
import 'package:flutter/material.dart';
import '../controller/user_form_controller.dart';
import 'package:hyper_ui/core.dart';


class UserFormView extends StatefulWidget {
  const UserFormView({Key? key}) : super(key: key);

  Widget build(context, UserFormController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Form"),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: Text("Add"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () => controller.createUser()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              QTextField(
                label: "Email",
                validator: Validator.email,
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
                suffixIcon: Icons.password,
                value: null,
                onChanged: (value) {
                  controller.password = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<UserFormView> createState() => UserFormController();
}
