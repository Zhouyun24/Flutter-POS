import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/purchase_order_view.dart';

class PurchaseOrderController extends State<PurchaseOrderView> {
  static late PurchaseOrderController instance;
  late PurchaseOrderView view;

  @override
  void initState() {
    instance = this;
    ProductService.clearQty();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  doCheckout() async {
    var productList =
        ProductService.productList.where((p) => p["qty"] > 0).toList();
    await PurchaseOrderService.chekcout(
      productList: productList,
    );
    Get.back();
    showInfoDialog("Your Order is success!");
  }
}
