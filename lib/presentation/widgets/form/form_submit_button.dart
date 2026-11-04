// ============================================================
// form_submit_button.dart
// ফর্মের নিচের ইন্ডিগো বাটন: "Save Transaction" / "Update Transaction"।
// রং ও সাইজ AppTheme থেকে আসে।
// ============================================================
import 'package:flutter/material.dart';

class FormSubmitButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed; // null হলে বাটন disabled

  const FormSubmitButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.save_outlined, size: 22),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
