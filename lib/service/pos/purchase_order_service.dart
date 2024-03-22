import 'package:hyper_ui/core.dart';

class PurchaseOrderService {
  static List purchaseOrderList = [];

  static saveToLocalStorage() async {
    await mainStorage.put("purchase_order", purchaseOrderList);
  }

  static loadDataFromDB() async {
    purchaseOrderList = await mainStorage.get("purchase_order") ?? [];
  }

  static chekcout({
    required List productList,
  }) async {
    //menyimpan data ke db purchase
    purchaseOrderList.add({
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
      ProductService.addStock(
        id: product["id"],
        qty: product["qty"],
      );
    }
  }
}
