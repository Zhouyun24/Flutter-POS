import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DoubleExtension on double? {
  String get format {
    if ((this ?? 0).toString().endsWith(".0")) {
      return (this ?? 0).floor().toString();
    }
    return (this ?? 0).toString();
  }

  String get currency {
    return "Rp" + NumberFormat().format(this);
  }
}
