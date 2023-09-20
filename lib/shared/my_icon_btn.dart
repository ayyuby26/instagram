import 'package:flutter/material.dart';

class MyIconBtn extends StatelessWidget {
  final void Function()? onTap;
  final Widget? icon;
  const MyIconBtn({super.key, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(99),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: icon,
        ),
      ),
    );
  }
}
