// ============================================================
// main.dart
// অ্যাপের এন্ট্রি পয়েন্ট। এখানে শুধু ProviderScope বসিয়ে অ্যাপ চালু করা হয়েছে।
// ProviderScope ছাড়া Riverpod কাজ করে না।
// ============================================================
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // স্ট্যাটাস বার স্বচ্ছ রাখা হয়েছে (UI mockup এর মতো)
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const ProviderScope(child: ExpenseTrackerApp()));
}
