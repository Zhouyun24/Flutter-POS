import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class QActionButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final Color? color;
  final IconData? icon;
  final bool enabled;
  const QActionButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.color,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const padding = 12.0;
    final height = 64.0;

    return Container(
      padding: const EdgeInsets.all(padding),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: height,
      child: QButton(
        label: label,
        icon: icon,
        enabled: enabled,
        onPressed: () => onPressed(),
      ),
    );
  }
}
