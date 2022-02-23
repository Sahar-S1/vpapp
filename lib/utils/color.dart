import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  hex = hex.toUpperCase().replaceAll('#', '');
  if (hex.length == 8) {
    hex = hex.substring(6) + hex.substring(0, 6);
  } else if (hex.length == 6) {
    hex = 'FF' + hex;
  }
  return Color(int.parse(hex, radix: 16));
}

String colorToHex(Color color) {
  return '#${color.value.toRadixString(16)}';
}
