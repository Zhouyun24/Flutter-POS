import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListItem extends StatelessWidget {
  final String label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function? onTap;
  final Color? color;

  const ListItem({
    super.key,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Clipboard.setData(ClipboardData(text: label));
      },
      onTap: () {
        Clipboard.setData(ClipboardData(text: label));
        if (onTap != null) {
          onTap!();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 10.0,
        ),
        child: Row(
          children: [
            if (prefixIcon != null) ...[
              Icon(
                prefixIcon,
                size: 20.0,
                color: color,
              ),
              const SizedBox(
                width: 12.0,
              ),
            ],
            Expanded(
              child: Text(
                "$label",
                style: TextStyle(
                  fontSize: 14.0,
                  color: color,
                ),
              ),
            ),
            if (suffixIcon != null) ...[
              const SizedBox(
                width: 8.0,
              ),
              Icon(
                suffixIcon,
                size: 24.0,
              ),
            ],
            if (suffixIcon == null) ...[
              const SizedBox(
                width: 12.0,
              ),
              Icon(
                Icons.chevron_right,
                size: 20.0,
                color: color,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
