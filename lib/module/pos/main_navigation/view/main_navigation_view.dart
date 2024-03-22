import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({Key? key}) : super(key: key);

  Widget build(context, MainNavigationController controller) {
    controller.view = this;

    return QNavigation(
      mode: QNavigationMode.nav2,
      pages: [
        DashboardView(),
        ProfileView(),
      ],
      menus: [
        NavigationMenu(
          icon: Icons.dashboard,
          label: "Dashboardss",
        ),
        NavigationMenu(
          icon: Icons.person,
          label: "Profile",
        ),
      ],
    );
  }

  @override
  State<MainNavigationView> createState() => MainNavigationController();
}
