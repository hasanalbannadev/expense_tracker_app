# Expense Tracker (Flutter)

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Riverpod](https://img.shields.io/badge/Riverpod-State_Management-2563EB?style=for-the-badge)
![SQLite](https://img.shields.io/badge/Sqflite-SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white)
![Material 3](https://img.shields.io/badge/Material_3-757575?style=for-the-badge&logo=materialdesign&logoColor=white)
![Clean Architecture](https://img.shields.io/badge/Clean-Architecture-success?style=for-the-badge)

A Personal Expense Tracker built with **Flutter**, **Riverpod**, **Sqflite** and **Clean Architecture**.
Users can add, view, update and delete income / expense transactions. Total income, total expense and
current balance are calculated automatically. All data is stored locally in SQLite and stays available
after the app is closed and reopened.

## Screenshots

| Dashboard | Add Transaction | All Transactions | Transaction Details |
|:---:|:---:|:---:|:---:|
| ![Dashboard](screenshots/01_dashboard.png) | ![Add](screenshots/02_add_transaction.png) | ![List](screenshots/03_all_transactions.png) | ![Details](screenshots/04_details.png) |

| Edit Transaction | Delete Dialog | Statistics | Profile |
|:---:|:---:|:---:|:---:|
| ![Edit](screenshots/05_edit_transaction.png) | ![Delete](screenshots/06_delete_dialog.png) | ![Stats](screenshots/07_statistics.png) | ![Profile](screenshots/08_profile.png) |

## Features

- **Dashboard**: app name, 3 summary cards (**Total Income**, **Total Expense**, **Current Balance**), recent transactions, and a FAB to add a transaction
- **Add Transaction** form: Title, Amount, Category (`DropdownButton`), Transaction Type (Income / Expense), Date (Date Picker), Save button
  - Title cannot be empty
  - Amount must be a valid positive number
  - Category and transaction type must be selected
- **Transaction List** with `ListView.builder`: title, amount, category, date and type; income in green and expense in red; search by title or category
- **Update Transaction**: tap a transaction, press Edit, the form opens with the saved data
- **Delete Transaction**: `AlertDialog` confirmation, then list and dashboard summaries update instantly
- **Transaction Details**: complete information with Edit and Delete options
- **Statistics**: This Month / Last Month income-expense bar chart and balance
- **Profile**: About App, Clear Data, Settings, Privacy Policy, Logout
- Responsive layout (small phone to tablet)

## Tech

| Item | Choice |
|------|--------|
| Framework | Flutter (Material 3) |
| State management | `flutter_riverpod` (`AsyncNotifier` + `Provider`) |
| Local database | `sqflite` (`expense_tracker.db`, table `transactions`) |
| Architecture | Clean Architecture (core / data / domain / presentation) |

## Database

**Database name:** `expense_tracker.db` &nbsp; **Table name:** `transactions`

| Column | Type |
|--------|------|
| id | INTEGER PRIMARY KEY AUTOINCREMENT |
| title | TEXT |
| amount | REAL |
| category | TEXT |
| type | TEXT (`income` / `expense`) |
| date | TEXT (ISO 8601) |

## Folder Structure

```
lib/
├── main.dart
├── core/
│   ├── constants/        (app_constants, app_categories)
│   ├── theme/            (app_colors, app_theme)
│   └── utils/            (date_formatter, currency_formatter, validators, chart_scale)
├── data/
│   ├── models/transaction_model.dart
│   ├── datasources/      (app_database, transaction_local_datasource)
│   └── repositories/transaction_repository_impl.dart
├── domain/
│   ├── entities/         (transaction_entity, transaction_type, expense_summary)
│   ├── repositories/transaction_repository.dart
│   └── usecases/         (get, add, update, delete, clear_all, calculate_summary)
└── presentation/
    ├── providers/        (transaction_providers, transaction_notifier, summary, recent, by_id, search, bottom_nav, stats)
    ├── navigation/app_navigator.dart
    ├── screens/          (main_shell, dashboard, all_transactions, transaction_form, transaction_details, statistics, profile)
    └── widgets/
        ├── common/       (responsive_body, empty_state, category_icon_circle, type_badge, confirm_dialog)
        ├── navigation/   (app_bottom_nav, add_transaction_fab)
        ├── dashboard/    (dashboard_header, summary_card, summary_cards_section, recent_transactions_section, recent_transaction_item)
        ├── transactions/ (transactions_header, transactions_list, transaction_card)
        ├── form/         (form_label, title_field, amount_field, category_dropdown, type_selector, type_option, date_picker_field, form_submit_button)
        ├── details/      (details_header, details_info_card, details_info_row, details_actions)
        ├── statistics/   (period_toggle, stats_legend, income_expense_chart, balance_card)
        └── profile/      (profile_header, profile_menu_list, profile_menu_item)
```

## Run the project

Create a Flutter project named `expense_tracker`, then copy `lib/`, `test/`, `pubspec.yaml`
and `analysis_options.yaml` from this repository into it (or run `flutter create .` inside this folder to generate the platform folders).

```bash
flutter create .
flutter pub get
flutter run
```

> `sqflite` works on Android and iOS. Run the app on an Android/iOS emulator or device.

## Test

```bash
flutter test
```

## Assignment Checklist

- [x] Dashboard with app name, 3 summary cards, recent transactions and FAB
- [x] Add Transaction form (Title, Amount, Category dropdown, Type, Date picker, Save)
- [x] Validation (title, positive amount, category, type)
- [x] Transaction list with `ListView.builder`, income / expense colors
- [x] Update transaction (edit screen with saved data)
- [x] Delete transaction with `AlertDialog`, instant list and summary update
- [x] Transaction details with Edit and Delete
- [x] Sqflite local database (`expense_tracker.db`, table `transactions`), data persists after restart
- [x] Riverpod state management with Clean Architecture
