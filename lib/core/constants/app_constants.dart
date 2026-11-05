// ============================================================
// app_constants.dart
// অ্যাপের সাধারণ ধ্রুবক (constant) মান এক জায়গায় রাখা হয়েছে।
// ============================================================
class AppConstants {
  AppConstants._();

  static const String appName = 'Expense Tracker';
  static const String appVersion = '1.0.0';
  static const String currencySymbol = '৳';

  // প্রোফাইল স্ক্রিনে যে নাম দেখাবে
  static const String profileName = 'Hasan Al Banna';

  // ড্যাশবোর্ডে সর্বশেষ কয়টি লেনদেন দেখাবে
  static const int recentTransactionLimit = 4;
}
