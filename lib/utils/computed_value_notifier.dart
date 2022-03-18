import 'package:flutter/foundation.dart';

class ComputedValueNotifier<T> extends ValueNotifier<T> {
  final Listenable listenable;
  final T Function() compute;

  ComputedValueNotifier(this.listenable, this.compute) : super(compute()) {
    listenable.addListener(_updateValue);
  }

  @override
  void dispose() {
    listenable.removeListener(_updateValue);
    super.dispose();
  }

  void _updateValue() {
    super.value = compute();
  }
}
