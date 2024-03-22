import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hyper_ui/core.dart';
import '../controller/profile_controller.dart';
import '../../../../shared/widget/list/list_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:get/get.dart" as Getx;

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[900],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100.0,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Email : ${controller.email}",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Role :",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          children: [
            SizedBox(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 58,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.logout),
                  label: const Text("Log Out"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    await Getx.Get.deleteAll();
                    await Get.offAll(LoginView());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
