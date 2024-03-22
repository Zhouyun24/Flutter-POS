import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/product_form_view.dart';

class ProductFormController extends State<ProductFormView> {
  static late ProductFormController instance;
  late ProductFormView view;

  @override
  void initState() {
    instance = this;

    if (widget.item != null) {
      productName = widget.item!["product_name"];
      price = widget.item!["price"];
      photo = widget.item!["photo"];
      description = widget.item!["description"];
    }
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String? productName;
  String? photo;
  double? price;
  String? description;

  bool get isEditMode {
    return widget.item != null;
  }

  doSave() async {
    if (isEditMode) {
      await ProductService.updateProduct(
        id: widget.item!["id"],
        photo: photo!,
        productName: productName!,
        price: price!,
        description: description!,
      );
    } else {
      await ProductService.addProduct(
        photo: photo!,
        productName: productName!,
        price: price!,
        description: description!,
      );
    }
    Get.back();
  }
}
