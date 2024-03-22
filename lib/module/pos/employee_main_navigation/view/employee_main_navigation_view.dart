import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/module/pos/employee_dasboard/view/employee_dashboard_view.dart';

class EmployeeMainNavigationView extends StatefulWidget {
  const EmployeeMainNavigationView({Key? key}) : super(key: key);

  Widget build(context, EmployeeMainNavigationController controller) {
    controller.view = this;

    return QNavigation(
      mode: QNavigationMode.nav2,
      pages: [
        EmployeeDashboardView(),
        ProfileView(),
      ],
      menus: [
        NavigationMenu(
          icon: Icons.dashboard,
          label: "Dashboard",
        ),
        NavigationMenu(
          icon: Icons.person,
          label: "Profile",
        ),
      ],
    );
  }

  @override
  State<EmployeeMainNavigationView> createState() =>
      EmployeeMainNavigationController();
}
