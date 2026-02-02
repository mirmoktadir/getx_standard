import 'package:flutter_riverpod/flutter_riverpod.dart';

final navbarSelectedIndexProvider = StateProvider<int>((ref) => 0);

void setNavbarIndex(WidgetRef ref, int index) {
  ref.read(navbarSelectedIndexProvider.notifier).state = index;
}
