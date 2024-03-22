import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get dMMMykkmm {
    return DateFormat("d MMM y kk:mm").format(this);
  }

  String get dMMMykkmmss {
    return DateFormat("d MMM y kk:mm:ss").format(this);
  }

  String get dMMMy {
    return DateFormat("d MMM y").format(this);
  }

  String get yMd {
    return DateFormat("y-MM-dd").format(this);
  }

  String get kkmm {
    return DateFormat("kk:mm").format(this);
  }
}

extension TimeOfDayExtension on TimeOfDay {
  String get kkmm {
    String hour = this.hour.toString().padLeft(2, "0");
    String time = this.minute.toString().padLeft(2, "0");
    return "$hour:$time";
  }
}
