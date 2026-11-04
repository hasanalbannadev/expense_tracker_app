// ============================================================
// transaction_form_screen.dart  (Presentation layer)
// Add Transaction ও Edit Transaction একই ফর্ম স্ক্রিন।
//   - transaction = null  -> নতুন যোগ (Save Transaction)
//   - transaction আছে     -> আগের তথ্যসহ edit (Update Transaction)
// Validation: title খালি নয়, amount positive number, category ও type বাছাই করা,
// তারিখ বাছাই করা।
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/date_formatter.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/entities/transaction_type.dart';
import '../providers/transaction_notifier.dart';
import '../widgets/common/responsive_body.dart';
import '../widgets/form/amount_field.dart';
import '../widgets/form/category_dropdown.dart';
import '../widgets/form/date_picker_field.dart';
import '../widgets/form/form_label.dart';
import '../widgets/form/form_submit_button.dart';
import '../widgets/form/title_field.dart';
import '../widgets/form/type_selector.dart';

class TransactionFormScreen extends ConsumerStatefulWidget {
  final TransactionEntity? transaction;

  const TransactionFormScreen({super.key, this.transaction});

  @override
  ConsumerState<TransactionFormScreen> createState() =>
      _TransactionFormScreenState();
}

class _TransactionFormScreenState extends ConsumerState<TransactionFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController;
  late final TextEditingController _amountController;
  late final TextEditingController _dateController;

  String? _category;
  TransactionType? _type;
  DateTime? _date;
  bool _saving = false;

  bool get _isEdit => widget.transaction != null;

  @override
  void initState() {
    super.initState();
    final t = widget.transaction;

    // Edit হলে আগের সেভ করা তথ্য ফর্মে বসানো হয়
    _titleController = TextEditingController(text: t?.title ?? '');
    _amountController = TextEditingController(
      text: t == null ? '' : _formatAmount(t.amount),
    );
    _dateController = TextEditingController(
      text: t == null ? '' : DateFormatter.short(t.date),
    );
    _category = t?.category;
    _type = t?.type;
    _date = t?.date;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  /// 2500.0 -> "2500", 99.5 -> "99.5"
  String _formatAmount(double value) {
    return value == value.truncateToDouble()
        ? value.toStringAsFixed(0)
        : value.toString();
  }

  /// Date Picker খুলে তারিখ বাছাই
  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked == null) return;

    setState(() {
      _date = picked;
      _dateController.text = DateFormatter.short(picked);
    });
  }

  Future<void> _submit() async {
    // সব ফিল্ডের validation চালানো
    if (!_formKey.currentState!.validate()) return;
    if (_saving) return;

    setState(() => _saving = true);

    final transaction = TransactionEntity(
      id: widget.transaction?.id, // Edit হলে একই id থাকে
      title: _titleController.text.trim(),
      amount: double.parse(_amountController.text.trim()),
      category: _category!,
      type: _type!,
      date: _date!,
    );

    final notifier = ref.read(transactionListProvider.notifier);
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final isEdit = _isEdit;

    try {
      if (isEdit) {
        await notifier.updateTransaction(transaction);
      } else {
        await notifier.addTransaction(transaction);
      }
      navigator.pop(); // সফল হলে ফর্ম বন্ধ
      messenger.showSnackBar(
        SnackBar(
          content: Text(isEdit ? 'Transaction updated' : 'Transaction added'),
        ),
      );
    } catch (_) {
      if (mounted) setState(() => _saving = false);
      messenger.showSnackBar(
        const SnackBar(content: Text('Could not save. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEdit ? 'Edit Transaction' : 'Add Transaction'),
      ),
      body: SafeArea(
        child: ResponsiveBody(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FormLabel('Title'),
                  TitleField(controller: _titleController),
                  const SizedBox(height: 18),
                  const FormLabel('Amount'),
                  AmountField(controller: _amountController),
                  const SizedBox(height: 18),
                  const FormLabel('Category'),
                  CategoryDropdown(
                    initialValue: _category,
                    onChanged: (value) => _category = value,
                  ),
                  const SizedBox(height: 18),
                  const FormLabel('Transaction Type'),
                  TypeSelector(
                    initialValue: _type,
                    onChanged: (value) => _type = value,
                  ),
                  const SizedBox(height: 18),
                  const FormLabel('Date'),
                  DatePickerField(
                    controller: _dateController,
                    onTap: _pickDate,
                  ),
                  const SizedBox(height: 28),
                  FormSubmitButton(
                    label: _isEdit ? 'Update Transaction' : 'Save Transaction',
                    onPressed: _saving ? null : _submit,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
