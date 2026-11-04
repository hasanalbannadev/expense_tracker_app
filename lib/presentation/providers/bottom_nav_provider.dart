// ============================================================
// bottom_nav_provider.dart  (Presentation layer)
// নিচের Navigation এর বর্তমান tab: 0=Home, 1=List, 2=Stats, 3=Profile
// ("See All" বা stats আইকন চাপলে অন্য জায়গা থেকেও tab বদলানো যায়)
// ============================================================
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void setIndex(int index) => state = index;
}

final bottomNavIndexProvider = NotifierProvider<BottomNavNotifier, int>(
  BottomNavNotifier.new,
);
