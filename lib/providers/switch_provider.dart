import 'package:flutter_riverpod/flutter_riverpod.dart';

class SwitchNotifier extends StateNotifier<bool> {
  SwitchNotifier() : super(false);

  void check(bool value) => state = value;
}

final switchProvider = StateNotifierProvider<SwitchNotifier, bool>(
  (ref) => SwitchNotifier(),
);
