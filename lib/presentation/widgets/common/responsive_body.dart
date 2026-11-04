// ============================================================
// responsive_body.dart
// বড় স্ক্রিনে (tablet/web) কনটেন্ট মাঝখানে max 600px চওড়া রাখে,
// ছোট ফোনে পুরো চওড়ায় থাকে। তাই overflow বা বেশি ছড়ানো সমস্যা হয় না।
// ============================================================
import 'package:flutter/material.dart';

class ResponsiveBody extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const ResponsiveBody({super.key, required this.child, this.maxWidth = 600});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
