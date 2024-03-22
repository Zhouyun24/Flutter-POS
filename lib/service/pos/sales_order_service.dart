import 'package:hyper_ui/core.dart';

class SalesOrderService {
  static List salesOrderList = [];

  static saveToLocalStorage() async {
    await mainStorage.put("sales_order", salesOrderList);
  }

  static loadDataFromDB() async {
    salesOrderList = await mainStorage.get("sales_order") ?? [];
  }

  static chekcout({
    required List productList,
  }) async {
    //menyimpan data ke db purchase
    salesOrderList.add({
      "create": DateTime.now().toString(),
      "item": productList,
      "total": ProductService.total,
    });

    //fix problem
    // await mainStorage.put("purchase_order", null);
    // purchaseOrderList = [];
    saveToLocalStorage();

    //mengupdate stock
    for (var product in productList) {
      ProductService.reduceStock(
        id: product["id"],
        qty: product["qty"],
      );
    }
  }
}
