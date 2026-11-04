// ============================================================
// amount_field.dart
// Amount এর TextField। শুধু সংখ্যা ও একটি দশমিক বিন্দু লেখা যায়।
// Validation: valid positive number হতে হবে।
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/utils/validators.dart';

class AmountField extends StatelessWidget {
  final TextEditingController controller;

  const AmountField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      // সর্বোচ্চ ২ দশমিক ঘর
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
      ],
      style: const TextStyle(fontSize: 17),
      decoration: const InputDecoration(
        hintText: 'Enter amount',
        prefixIcon: SizedBox(
          width: 48,
          child: Center(
            child: Text(
              AppConstants.currencySymbol,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
      validator: Validators.amount,
    );
  }
}
