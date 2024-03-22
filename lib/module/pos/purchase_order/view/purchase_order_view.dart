import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/purchase_order_controller.dart';

class PurchaseOrderView extends StatefulWidget {
  const PurchaseOrderView({Key? key}) : super(key: key);

  Widget build(context, PurchaseOrderController controller) {
    controller.view = this;
    // var formattedTotal = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
    //     .format(ProductService.total);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Purchase Order"),
        actions: const [],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          children: [
            Divider(),
            SizedBox(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 58,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.check),
                  label: const Text("Checkout"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () => controller.doCheckout(),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ListView.builder(
                itemCount: ProductService.productList.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                clipBehavior: Clip.none,
                itemBuilder: (context, index) {
                  var item = ProductService.productList[index];
                  // var formattedPrice =
                  //     NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
                  //         .format(item["price"]);
                  item["qty"] = item["qty"] ?? 0;
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        backgroundImage: NetworkImage(
                          item["photo"],
                        ),
                      ),
                      title: Text("${item["product_name"]}"),
                      trailing: SizedBox(
                        width: 150.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              radius: 12.0,
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    if (item["qty"] == 0) return;
                                    item["qty"]--;
                                    controller.setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 9.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "${item["qty"]}",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              radius: 12.0,
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    item["qty"]++;
                                    controller.setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 9.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
  State<PurchaseOrderView> createState() => PurchaseOrderController();
}
