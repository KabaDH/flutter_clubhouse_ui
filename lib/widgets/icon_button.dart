import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconButtonW extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  const IconButtonW({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    ///IconButton adds unwanted? padding
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Icon(
        icon,
        color: Colors.black87.withOpacity(0.8),
        size: 26,
      ),
      onPressed: onTap,
    );
    // return GestureDetector(
    //   onTap: onTap,
    //   child: Icon(
    //     icon,
    //     color: Colors.grey[600],
    //     size: 26,
    //   ),
    // );
  }
}
