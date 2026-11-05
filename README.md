# 💰 Expense Tracker

Flutter দিয়ে বানানো **Personal Expense Tracker**। দৈনন্দিন আয়-ব্যয় যোগ, দেখা, আপডেট ও ডিলিট করা যায়।
মোট আয়, মোট খরচ ও বর্তমান ব্যালেন্স নিজে নিজে (dynamic) হিসাব হয়। সব ডাটা **Sqflite** এ সেভ হয়, তাই অ্যাপ বন্ধ করে খুললেও থাকে।

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)
![Riverpod](https://img.shields.io/badge/State-Riverpod%203-2E3192)
![SQLite](https://img.shields.io/badge/DB-Sqflite-003B57?logo=sqlite)
![Architecture](https://img.shields.io/badge/Architecture-Clean-16A34A)

## ✨ Features

| # | Assignment requirement | কোথায় আছে |
|---|---|---|
| 1 | Dashboard: app name, ৩টি summary card, recent list, FAB | `screens/dashboard`, `widgets/dashboard` |
| 2 | Add Transaction + Validation | `screens/add_transaction`, `widgets/form`, `core/utils/validators.dart` |
| 3 | Transaction List (`ListView.builder`, আয়=সবুজ / খরচ=লাল) | `screens/transaction_list` |
| 4 | Update Transaction (আগের তথ্যসহ edit) | `screens/edit_transaction` |
| 5 | Delete + AlertDialog, summary আপডেট | `widgets/common/confirm_dialog.dart` |
| 6 | Transaction Details + Edit/Delete | `screens/transaction_details` |
| 7 | Sqflite: `expense_tracker.db` → `transactions` table | `core/database`, `data/` |

**Extra:** Statistics (This Month / Last Month বার চার্ট), Profile, সার্চ, empty state, loading state।

## 🗃️ Database

```sql
CREATE TABLE transactions (
  id       INTEGER PRIMARY KEY AUTOINCREMENT,
  title    TEXT NOT NULL,
  amount   REAL NOT NULL,
  category TEXT NOT NULL,
  type     TEXT NOT NULL,   -- 'income' | 'expense'
  date     TEXT NOT NULL    -- ISO-8601
)
```

## 📁 Folder Structure

```
lib/
├── main.dart
├── app.dart
├── core/
│   ├── constants/   app_colors, app_strings, app_categories, db_constants ...
│   ├── database/    database_helper.dart
│   ├── theme/       app_theme, app_input_decoration
│   └── utils/       validators, currency_formatter, date_formatter, chart_axis
├── data/
│   ├── models/        transaction_model.dart
│   ├── datasources/   transaction_local_datasource.dart
│   └── repositories/  transaction_repository_impl.dart
├── domain/
│   ├── entities/      transaction_entity, transaction_type, transaction_summary
│   ├── repositories/  transaction_repository.dart (abstract)
│   └── usecases/      get / add / update / delete / clear / calculate_summary / monthly
└── presentation/
    ├── providers/     Riverpod providers & notifiers
    ├── navigation/    app_navigator.dart
    ├── screens/       main, dashboard, add, edit, list, details, statistics, profile
    └── widgets/       common, dashboard, form, transaction, details, statistics, profile, navigation
```

**Data flow:** `UI → Provider/Notifier → UseCase → Repository → DataSource → Sqflite`

## 🧠 State Management (Riverpod 3)

- `transactionsProvider` (`AsyncNotifier`) — সব লেনদেনের মূল state; add/update/delete এর পর DB থেকে reload হয়।
- `summaryProvider`, `recentTransactionsProvider`, `filteredTransactionsProvider`, `monthlyStatsProvider` — মূল state থেকে তৈরি, তাই কোনো লেনদেন বদলালে Dashboard, List ও Statistics নিজে আপডেট হয়।

## ▶️ Run করার নিয়ম

```bash
# ১) নতুন Flutter প্রজেক্ট বানান
flutter create expense_tracker
cd expense_tracker

# ২) এই repo এর lib/, test/, pubspec.yaml, analysis_options.yaml দিয়ে প্রতিস্থাপন করুন
#    (পুরনো lib, test ফোল্ডার মুছে দিয়ে কপি করবেন; test/widget_test.dart মুছে যাবে)

# ৩) প্যাকেজ আনুন ও চালান
flutter pub get
flutter run
```

> Red line দেখালে আগে `flutter pub get` চালান, তারপর VS Code এ `Dart: Restart Analysis Server` দিন।

Test চালাতে: `flutter test`

## ✅ Validation

- Title খালি থাকা যাবে না
- Amount অবশ্যই valid positive number
- Category সিলেক্ট করতে হবে
- Transaction type (Income/Expense) সিলেক্ট করতে হবে
- Date সিলেক্ট করতে হবে

## 📦 Packages

`flutter_riverpod`, `sqflite`, `path`, `intl`

## 👤 Author

Hasan Al Banna
