// ============================================================
// navigation_provider.dart
// Bottom navigation এর বর্তমান ট্যাব (0=Home, 1=List, 2=Stats, 3=Profile)।
// ============================================================
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavIndexNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void setIndex(int index) => state = index;
}

final bottomNavIndexProvider =
    NotifierProvider<BottomNavIndexNotifier, int>(BottomNavIndexNotifier.new);
