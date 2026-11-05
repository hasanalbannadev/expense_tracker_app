// ============================================================
// transaction_form.dart
// Add ও Edit দুই স্ক্রিনেই এই একই ফর্ম ব্যবহার হয় (code reuse)।
//  - initial থাকলে Edit mode: আগের তথ্য ফর্মে বসে যায়।
//  - Save চাপলে সব validation চলে, পাশ হলে onSubmit কল হয়।
// ============================================================
import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/utils/date_formatter.dart';
import '../../../domain/entities/transaction_entity.dart';
import '../../../domain/entities/transaction_type.dart';
import '../common/primary_button.dart';
import 'amount_field.dart';
import 'category_dropdown.dart';
import 'date_picker_field.dart';
import 'form_label.dart';
import 'title_field.dart';
import 'transaction_type_selector.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({
    super.key,
    this.initial,
    required this.submitLabel,
    required this.submitIcon,
    required this.onSubmit,
  });

  final TransactionEntity? initial;
  final String submitLabel;
  final IconData submitIcon;
  final Future<void> Function(TransactionEntity transaction) onSubmit;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController;
  late final TextEditingController _amountController;
  late final TextEditingController _dateController;

  String? _category;
  TransactionType? _type;
  DateTime? _date;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    final initial = widget.initial;

    _titleController = TextEditingController(text: initial?.title ?? '');
    _amountController = TextEditingController(
      text: initial == null ? '' : _amountToText(initial.amount),
    );
    _dateController = TextEditingController(
      text: initial == null ? '' : DateFormatter.display(initial.date),
    );

    _category = initial?.category;
    _type = initial?.type;
    _date = initial?.date;
  }

  // 2500.0 -> "2500", 99.5 -> "99.5"
  String _amountToText(double amount) {
    return amount == amount.roundToDouble()
        ? amount.toInt().toString()
        : amount.toString();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();

    // সব ফিল্ডের validation একসাথে চালানো
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    final transaction = TransactionEntity(
      id: widget.initial?.id,
      title: _titleController.text.trim(),
      amount: double.parse(_amountController.text.trim().replaceAll(',', '')),
      category: _category!,
      type: _type!,
      date: _date!,
    );

    try {
      await widget.onSubmit(transaction);
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FormLabel(AppStrings.title),
          TitleField(controller: _titleController),
          const SizedBox(height: 8),
          const FormLabel(AppStrings.amount),
          AmountField(controller: _amountController),
          const SizedBox(height: 18),
          const FormLabel(AppStrings.category),
          CategoryDropdown(
            initialValue: _category,
            onChanged: (value) => _category = value,
          ),
          const SizedBox(height: 18),
          const FormLabel(AppStrings.transactionType),
          TransactionTypeSelector(
            initialValue: _type,
            onChanged: (value) => _type = value,
          ),
          const SizedBox(height: 18),
          const FormLabel(AppStrings.date),
          DatePickerField(
            controller: _dateController,
            selectedDate: _date,
            onPicked: (value) => _date = value,
          ),
          const SizedBox(height: 28),
          PrimaryButton(
            label: widget.submitLabel,
            icon: widget.submitIcon,
            isLoading: _isSaving,
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}
