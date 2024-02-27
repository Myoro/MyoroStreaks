import 'package:flutter/material.dart';

enum StreakStatusEnum {
  beginning(1, Color(0xFF808080)),
  going(7, Color(0xFFFFFFCC)),
  steady(14, Color(0xFF98FB98)),
  awesome(365, Color(0xFFADD8E6));

  final int dayDifferenceOfStreak;
  final Color color;

  const StreakStatusEnum(this.dayDifferenceOfStreak, this.color);
}
