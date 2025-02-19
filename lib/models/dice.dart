import 'dart:ui';

import 'package:collection/collection.dart';
import 'dart:math';

import 'package:flutter/material.dart';

class Dice {
  final List<int?> _values;
  final List<bool> _held;
  List<Color> _colors;

  Dice(int numDice)
      : _values = List<int?>.filled(numDice, null),
        _held = List<bool>.filled(numDice, false),
        _colors = List<Color>.filled(numDice, Colors.white);

  List<int> get values => List<int>.unmodifiable(_values.whereNotNull());

  List<bool> get held => _held;

  int? operator [](int index) => _values[index];

  bool isHeld(int index) => _held[index];

  void clear() {
    for (var i = 0; i < _values.length; i++) {
      _values[i] = null;
      _held[i] = false;
    }
  }

  void clearColor() {
    for (var i = 0; i < _values.length; i++) {
      _colors[i] = Colors.white;
      _held[i] = false;
      _values[i] = null;
    }
  }

  void roll() {
    for (var i = 0; i < _values.length; i++) {
      if (!_held[i]) {
        _values[i] = Random().nextInt(6) + 1;
      }
    }
  }

  void toggleHold(int index) {
    _held[index] = !_held[index];
  }
}
