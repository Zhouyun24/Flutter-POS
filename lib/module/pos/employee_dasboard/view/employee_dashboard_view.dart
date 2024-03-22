import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class EmployeeDashboardView extends StatefulWidget {
  EmployeeDashboardView({Key? key}) : super(key: key);

  Widget build(context, EmployeeDashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              LayoutBuilder(
                builder: (context, constraint) {
                  List menus = [
                    {
                      "icon":
                          "https://cdn-icons-png.flaticon.com/128/2168/2168201.png",
                      "label": "Purcase\nOrder",
                      "onTap": () => Get.to(const PurchaseOrderView()),
                    },
                    {
                      "icon":
                          "https://cdn-icons-png.flaticon.com/128/2666/2666436.png",
                      "label": "Sales\nOrder  ",
                      "onTap": () => Get.to(const SalesTransactionView()),
                    },
                  ];

                  return Wrap(
                    children: List.generate(
                      menus.length,
                      (index) {
                        var item = menus[index];

                        var size = constraint.biggest.width / 4;

                        return SizedBox(
                          width: size,
                          height: size,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.blueGrey,
                              animationDuration:
                                  const Duration(milliseconds: 1000),
                              backgroundColor: Colors.transparent,
                              splashFactory: InkSplash.splashFactory,
                              shadowColor: Colors.transparent,
                              elevation: 0.0,
                            ),
                            onPressed: () => item["onTap"](),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  item["icon"],
                                  width: 30.0,
                                ),
                                const SizedBox(
                                  height: 6.0,
                                ),
                                Text(
                                  "${item["label"]}",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 11.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<EmployeeDashboardView> createState() => EmployeeDashboardController();
}
