enum StreakStatusEnum {
  beginning(1),
  going(7),
  steady(14),
  awesome(365);

  final int dayDifferenceOfStreak;

  const StreakStatusEnum(this.dayDifferenceOfStreak);
}
