import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/sales_transaction_view.dart';

class SalesTransactionController extends State<SalesTransactionView> {
  static late SalesTransactionController instance;
  late SalesTransactionView view;

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
    await SalesOrderService.chekcout(
      productList: productList,
    );
    Get.back();
    showInfoDialog("Your Order is success!");
  }
}
