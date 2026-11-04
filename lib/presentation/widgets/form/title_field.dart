// ============================================================
// title_field.dart
// Title এর TextField। খালি থাকলে error দেখায়।
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/utils/validators.dart';

class TitleField extends StatelessWidget {
  final TextEditingController controller;

  const TitleField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      textCapitalization: TextCapitalization.sentences,
      style: const TextStyle(fontSize: 17),
      decoration: const InputDecoration(
        hintText: 'Enter title',
        prefixIcon: Icon(Icons.label_outline_rounded),
      ),
      validator: Validators.title,
    );
  }
}
