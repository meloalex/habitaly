import 'package:Habitaly/utilities/range.dart';
import 'package:flutter/material.dart';

class Appearance {
  static const Color PRIMARY_COLOR = Color(0xff5049A3);
  static const Color PRIMARY_LIGHT_COLOR = Color(0x42FFFFFF);
  static const Color BLUE = Color(0xff15ACFF);
  static const Color BACKGROUND_CIRCLE_COLOR = Color(0x10807BBD);
  static const Color GREEN = Color(0xFF56E39F);
  static const Color LIGHT_RED = Color(0xFFFF7E80);
  static const Color PINK = Color(0xFFFF4D80);

  static Map<String, IconData> categoryIcons = {
    'Category': Icons.category,
    'Sport': Icons.supervisor_account,
    'Leisure': Icons.supervisor_account,
    'Nutrition': Icons.fastfood
  };

  static Map<String, Color> categoryColors = {
    'Category': Colors.transparent,
    'Sport': BLUE,
    'Leisure': LIGHT_RED,
    'Nutrition': GREEN,
  };

  static Map<Range, String> streakEmojis = {
    Range(-500, -5): '😡',
    Range(-4, -3): '😩',
    Range(-2, -1): '🙁',
    Range(0, 2): '🙂',
    Range(3, 5): '😀',
    Range(5, 8): '😁',
    Range(9, 500): '🔥'
  };
}
