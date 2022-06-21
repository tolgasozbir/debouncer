import 'package:flutter/material.dart';
import 'dart:async';

class Debouncer {
  Timer? _timer;

  debounce({required VoidCallback function, int? milliseconds}) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds ?? 500), function);
  }

  dispose() {
    _timer?.cancel();
  }
}